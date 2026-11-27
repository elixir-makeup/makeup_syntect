defmodule MakeupSyntectTest do
  use ExUnit.Case, async: true

  doctest MakeupSyntect

  defp lex(text, opts \\ []) do
    text
    |> MakeupSyntect.tokenize(opts)
    |> Enum.map(fn {type, _meta, value} -> {type, IO.iodata_to_binary([value])} end)
  end

  test "tokenizes code with detected language" do
    assert lex(~s(<?xml version="1.0" encoding="UTF-8"?>)) == [
             punctuation: "<?",
             name_tag: "xml",
             whitespace: " ",
             name_attribute: "version",
             punctuation: "=",
             punctuation: "\"",
             string_double: "1.0",
             punctuation: "\"",
             whitespace: " ",
             name_attribute: "encoding",
             punctuation: "=",
             punctuation: "\"",
             string_double: "UTF-8",
             punctuation: "\"",
             punctuation: "?>"
           ]
  end

  test "tokenizes code with specified language" do
    assert lex("if (foo) {}", language: "JavaScript") == [
             {:keyword, "if"},
             {:whitespace, " "},
             {:punctuation, "("},
             {:name_variable, "foo"},
             {:punctuation, ")"},
             {:whitespace, " "},
             {:punctuation, "{"},
             {:punctuation, "}"}
           ]
  end

  test "can add own sublime-syntax files" do
    syntax_set = MakeupSyntect.initialize_syntaxes_from_folders([__DIR__])

    assert lex("if foo {}",
             language: "Demo C",
             syntax_set: syntax_set
           ) == [keyword: "if", text: " foo {}"]
  end

  describe "scope mapping" do
    test "maps generic entity.name scopes to name_entity" do
      assert {:name_entity, %{scope: ["source.lean4", "entity.name.lean4"]}, "law:requires/1"} =
               "#check «law:requires/1»"
               |> MakeupSyntect.tokenize(language: "lean")
               |> Enum.find(fn {_, _, value} -> value == "law:requires/1" end)
    end

    test "maps type names to name_class" do
      assert {:name_class, "Foo"} in lex("struct Foo;", language: "rs")
      assert {:name_class, "Foo"} in lex("impl Foo {}", language: "rs")
      assert {:name_class, "Foo"} in lex("enum Foo {}", language: "rs")
      assert {:name_class, "Foo"} in lex("type Foo struct {}", language: "go")
    end

    test "maps entity.name.label to name_label" do
      assert {:name_label, "'a"} in lex("'a: loop {}", language: "rs")
    end

    test "keeps entity.name.constant as name_constant" do
      assert {:name_constant, "FOO"} in lex("#define FOO 1", language: "c")
    end

    test "maps text with only the base scope to text" do
      assert [{:text, %{scope: ["source.lean4"]}, " x"}] =
               MakeupSyntect.tokenize(" x", language: "lean")
    end
  end

  describe "syntax lookup" do
    @tag :tmp_dir
    test "a user syntax overrides a bundled syntax with the same file extension", %{
      tmp_dir: tmp_dir
    } do
      File.write!(Path.join(tmp_dir, "My Lean.sublime-syntax"), """
      %YAML 1.2
      ---
      name: My Lean
      file_extensions:
        - lean
      scope: source.mylean
      contexts:
        main:
          - match: '\\btheorem\\b'
            scope: keyword.declaration.mylean
      """)

      syntax_set = MakeupSyntect.initialize_syntaxes_from_folders([tmp_dir])

      assert [{:keyword_declaration, %{language: "my lean"}, "theorem"}] =
               MakeupSyntect.tokenize("theorem", language: "lean", syntax_set: syntax_set)

      # The bundled syntax is still available by name.
      assert [{:keyword, %{language: "lean 4"}, "theorem"}] =
               MakeupSyntect.tokenize("theorem", language: "Lean 4", syntax_set: syntax_set)
    end
  end
end
