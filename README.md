# MakeupSyntect

Lexes code for Elixir's Makeup project using the [syntect](https://docs.rs/syntect/latest/syntect/) Rust library.
More syntax definitions are included from [two-face](https://docs.rs/two-face/latest/two_face/).

At the moment, 205 different syntaxes are supported. For a list of supported languages, see [the documentation](https://steffende.github.io/makeup_syntect/MakeupSyntect.Syntaxes.html).

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

## Installation

The package can be installed by adding `makeup_syntect` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:makeup_syntect, github: "SteffenDE/makeup_syntect"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/makeup_syntect>.
