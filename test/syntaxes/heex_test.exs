defmodule MakeupSyntect.Syntaxes.HEExTest do
  use ExUnit.Case, async: true

  defp lex(text, opts \\ []) do
    text
    |> MakeupSyntect.tokenize(opts)
    |> Enum.map(fn {type, _meta, value} -> {type, value} end)
  end

  test "handles HEEx components in HTML" do
    assert lex("<.component foo= >", language: "HTML") ==
             [
               punctuation: "<",
               name_tag: ".component",
               whitespace: " ",
               name_entity: "foo",
               punctuation: "=",
               whitespace: " ",
               punctuation: ">"
             ]
  end

  test "handles HEEx slots in HTML" do
    assert lex("<:slot foo= >", language: "HTML") == [
             punctuation: "<",
             name_tag: ":slot",
             whitespace: " ",
             name_entity: "foo",
             punctuation: "=",
             whitespace: " ",
             punctuation: ">"
           ]
  end

  test "handles empty heex attributes" do
    assert lex(~s(<.dynamic_component module= function= shared="Yay" />)) == [
             {:punctuation, "<"},
             {:name_tag, ".dynamic_component"},
             {:whitespace, " "},
             {:name_entity, "module"},
             {:punctuation, "="},
             {:whitespace, " "},
             {:name_entity, "function"},
             {:punctuation, "="},
             {:whitespace, " "},
             {:name_entity, "shared"},
             {:punctuation, "="},
             {:punctuation, "\""},
             {:string_double, "Yay"},
             {:punctuation, "\""},
             {:whitespace, " "},
             {:punctuation, "/>"}
           ]
  end
end
