# MakeupSyntect

Lexes code for Elixir's Makeup project using the [syntect](https://docs.rs/syntect/latest/syntect/) Rust library.
More syntax definitions are included from [two-face](https://docs.rs/two-face/latest/two_face/).

At the moment, 205 different syntaxes are supported. For a list of supported languages, see [the documentation](https://hexdocs.pm/makeup_syntect/MakeupSyntect.Syntaxes.html).

MakeupSyntect automatically registers those syntaxes in Makeup's registry (exceptions see below),
which allows them to be used in ExDoc and other projects using Makeup. The name to use when writing
markdown code blocks in ExDoc is shown in brackets in the `MakeupSyntect.Syntaxes` module documentation.

Note that by default, the following syntaxes are disabled, as the existing Makeup lexers are considered to be better:

* `"elixir"`
* `"erlang"`
* `"html_eex"`

We recommend you to use the `:makeup_elixir` / `:makeup_erlang` / `:makeup_eex` packages instead.

To configure which languages to register for, the `:register_for_languages` and `:excluded_languages` configurations can be used.:

```elixir
config :makeup_syntect,
  register_for_languages: ["rust", "toml"], # default: :all
  excluded_languages: []                    # default: ["elixir", "erlang", "html_eex"]
```

## Code block names

A code block can use the syntax name in lowercase with spaces and brackets replaced by
underscores (for example `lean_4` for "Lean 4"), or one of the syntax's file extensions
(for example `lean`, `rs` or `py`). A syntax name always takes precedence over a file extension.
If several syntaxes use the same file extension, the syntax that was added last wins.

## Adding and overriding syntaxes

Use the `:extra_syntax_folders` option to load your own `.sublime-syntax` files. MakeupSyntect
loads them at application start and registers them in Makeup like the bundled syntaxes:

```elixir
config :makeup_syntect,
  extra_syntax_folders: [Path.expand("../priv/syntaxes", __DIR__)]
```

Syntaxes are added in this order: the bundled syntaxes, the syntaxes in this package's
`priv/extra_syntaxes`, and then the folders in `:extra_syntax_folders`. A syntax that is added
later overrides earlier syntaxes with the same file extension or name. For example, a grammar with
`name: Lean` and `file_extensions: [lean]` replaces the bundled "Lean 4" syntax for `lean` code blocks
and adds the `lean` code block name. The bundled syntax stays available as `lean_4`. This package
uses the same mechanism to replace the bundled HTML syntax with a more permissive version for HEEx.

## Installation

The package can be installed by adding `makeup_syntect` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:makeup_syntect, "~> 0.1"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/makeup_syntect>.
