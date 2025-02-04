use rustler::{Env, NifResult, NifTuple, NifMap};
use syntect::easy::ScopeRegionIterator;
use syntect::parsing::{ParseState, SyntaxReference, ScopeStack, ScopeStackOp};

#[derive(NifMap)]
struct TokenMetadata {
    language: String,
    scope: String,
}

#[derive(NifTuple)]
struct Token {
    token_type: rustler::Atom,
    metadata: TokenMetadata,
    content: String,
}

#[derive(NifMap)]
struct SyntaxInfo {
    name: String,
    file_extensions: Vec<String>,
}

fn detect_language(syntax_ref: &SyntaxReference) -> String {
    syntax_ref.name.to_lowercase()
}

fn map_scope_to_token_type(env: Env, scope_name: &str, token_str: &str) -> NifResult<rustler::Atom> {
    let get_atom = |name: &str| rustler::Atom::from_str(env, name);

    // First check if it's whitespace
    if token_str.trim().is_empty() {
        return get_atom("whitespace");
    }

    // Map scope to token type
    let token_type = if scope_name.contains("comment") {
        if scope_name.contains("documentation") {
            "string_doc"
        } else if scope_name.contains("hashbang") {
            "comment_hashbang"
        } else if scope_name.contains("block") {
            "comment_multiline"
        } else if scope_name.contains("line") {
            "comment_single"
        } else if scope_name.contains("preprocessor") {
            "comment_preproc"
        } else {
            "comment"
        }
    } else if scope_name.contains("constant") {
        if scope_name.contains("numeric") || scope_name.contains("number") {
            if scope_name.contains("integer") {
                if scope_name.contains("long") {
                    "number_integer_long"
                } else {
                    "number_integer"
                }
            } else if scope_name.contains("float") {
                "number_float"
            } else if scope_name.contains("hex") {
                "number_hex"
            } else if scope_name.contains("oct") {
                "number_oct"
            } else if scope_name.contains("bin") {
                "number_bin"
            } else {
                "number"
            }
        } else if scope_name.contains("language") {
            "keyword_constant"
        } else {
            "name_constant"
        }
    } else if scope_name.contains("string") {
        if scope_name.contains("regex") {
            "string_regex"
        } else if scope_name.contains("heredoc") {
            "string_heredoc"
        } else if scope_name.contains("character") {
            "string_char"
        } else if scope_name.contains("symbol") {
            "string_symbol"
        } else if scope_name.contains("interpolated") {
            "string_interpol"
        } else if scope_name.contains("backtick") {
            "string_backtick"
        } else if scope_name.contains("escape") {
            "string_escape"
        } else if scope_name.contains("double") {
            "string_double"
        } else if scope_name.contains("single") {
            "string_single"
        } else if scope_name.contains("sigil") {
            "string_sigil"
        } else if scope_name.contains("affix") {
            "string_affix"
        } else if scope_name.contains("delimiter") {
            "string_delimiter"
        } else {
            "string"
        }
    } else if scope_name.contains("keyword") {
        if scope_name.contains("type") {
            "keyword_type"
        } else if scope_name.contains("namespace") {
            "keyword_namespace"
        } else if scope_name.contains("declaration") {
            "keyword_declaration"
        } else if scope_name.contains("constant") {
            "keyword_constant"
        } else if scope_name.contains("pseudo") {
            "keyword_pseudo"
        } else if scope_name.contains("reserved") {
            "keyword_reserved"
        } else if scope_name.contains("control") {
            "keyword"
        } else {
            "keyword"
        }
    } else if scope_name.contains("entity.name") {
        if scope_name.contains("function") {
            if scope_name.contains("magic") {
                "name_function_magic"
            } else {
                "name_function"
            }
        } else if scope_name.contains("class") {
            "name_class"
        } else if scope_name.contains("tag") {
            "name_tag"
        } else if scope_name.contains("section") {
            "generic_heading"
        } else if scope_name.contains("namespace") {
            "name_namespace"
        } else {
            "name"
        }
    } else if scope_name.contains("variable") {
        if scope_name.contains("parameter") {
            "name_variable"
        } else if scope_name.contains("instance") {
            "name_variable_instance"
        } else if scope_name.contains("global") {
            "name_variable_global"
        } else if scope_name.contains("class") {
            "name_variable_class"
        } else if scope_name.contains("magic") {
            "name_variable_magic"
        } else {
            "name_variable"
        }
    } else if scope_name.contains("support") {
        if scope_name.contains("function") {
            "name_builtin"
        } else if scope_name.contains("class") {
            "name_builtin_pseudo"
        } else if scope_name.contains("type") {
            "name_builtin"
        } else {
            "name_builtin"
        }
    } else if scope_name.contains("markup") {
        if scope_name.contains("deleted") {
            "generic_deleted"
        } else if scope_name.contains("inserted") {
            "generic_inserted"
        } else if scope_name.contains("heading") {
            "generic_heading"
        } else if scope_name.contains("bold") {
            "generic_strong"
        } else if scope_name.contains("italic") {
            "generic_emph"
        } else if scope_name.contains("raw") {
            "generic"
        } else if scope_name.contains("quote") {
            "generic"
        } else {
            "text"
        }
    } else if scope_name.contains("punctuation") {
        "punctuation"
    } else if scope_name.contains("operator") {
        if scope_name.contains("word") {
            "operator_word"
        } else {
            "operator"
        }
    } else if scope_name.contains("invalid") {
        if scope_name.contains("deprecated") {
            "error"
        } else {
            "error"
        }
    } else if scope_name.contains("storage") {
        if scope_name.contains("type") {
            "keyword_type"
        } else if scope_name.contains("modifier") {
            "keyword_declaration"
        } else {
            "keyword"
        }
    } else {
        "text"
    };

    get_atom(token_type)
}

#[rustler::nif]
fn do_tokenize(env: Env, text: String, language_opt: Option<String>, syntax_folder: Option<String>) -> NifResult<Vec<Token>> {
    let syntax_set = if let Some(folder) = syntax_folder {
        let mut builder = two_face::syntax::extra_newlines().into_builder();
        // Then load custom syntaxes from the folder
        builder.add_from_folder(folder, true)
            .map_err(|e| rustler::Error::Term(Box::new(e.to_string())))?;
        builder.build()
    } else {
        two_face::syntax::extra_newlines()
    };

    let syntax = match language_opt {
        Some(lang) => syntax_set
            .find_syntax_by_extension(&lang)
            .or_else(|| syntax_set.find_syntax_by_name(&lang)),
        None => syntax_set
            .find_syntax_by_first_line(&text)
            .or_else(|| syntax_set.find_syntax_by_extension("html")),
    }
    .unwrap_or_else(|| syntax_set.find_syntax_plain_text());

    let language = detect_language(&syntax);
    let mut parse_state = ParseState::new(syntax);
    let mut tokens = Vec::new();    
    let mut stack = ScopeStack::new();

    // Split the text into lines while preserving line endings
    let lines: Vec<&str> = text.split_inclusive('\n').collect();
    
    for line in lines {
        let ops: Vec<(usize, ScopeStackOp)> = parse_state.parse_line(&line, &syntax_set).unwrap();
        
        for (token_str, op) in ScopeRegionIterator::new(&ops, line) {
            stack.apply(op).map_err(|e| rustler::Error::Term(Box::new(e.to_string())))?;
            
            if token_str.is_empty() {
                continue;
            }

            // Get the full scope name from the stack
            let scope_name = stack.as_slice().iter()
                .map(|s| s.build_string())
                .collect::<Vec<_>>()
                .join(" ");

            let token_type = map_scope_to_token_type(env, &scope_name, token_str)?;

            tokens.push(Token {
                token_type,
                metadata: TokenMetadata {
                    language: language.clone(),
                    scope: scope_name,
                },
                content: token_str.to_string(),
            });
        }
    }

    Ok(tokens)
}

#[rustler::nif]
fn supported_syntaxes() -> NifResult<Vec<SyntaxInfo>> {
    let syntax_set = two_face::syntax::extra_newlines();
    
    let syntaxes: Vec<SyntaxInfo> = syntax_set
        .syntaxes()
        .iter()
        .map(|syntax| SyntaxInfo {
            name: syntax.name.clone(),
            file_extensions: syntax.file_extensions.clone(),
        })
        .collect();

    Ok(syntaxes)
}

rustler::init!("Elixir.MakeupSyntect");
