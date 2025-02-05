defmodule MakeupSyntectTest do
  use ExUnit.Case
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
             name_entity: "version",
             punctuation: "=",
             punctuation: "\"",
             string_double: "1.0",
             punctuation: "\"",
             whitespace: " ",
             name_entity: "encoding",
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
           ) == [keyword: "if", name: " foo {}"]
  end
end
