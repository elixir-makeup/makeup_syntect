defmodule MakeupSyntect.Syntaxes.ExtraSyntaxesConfigTest do
  use ExUnit.Case, async: false

  test "loads extra syntaxes" do
    Application.put_env(:makeup_syntect, :extra_syntax_folders, [Path.join(__DIR__, "..")])
    on_exit(fn -> Application.put_env(:makeup_syntect, :extra_syntax_folders, []) end)

    MakeupSyntect.initialize_default_syntax_set()

    assert MakeupSyntect.Lexer.lex("if foo {}", language: "Demo C") == [
             {:keyword, %{scope: ["source.c", "keyword.control.c"], language: "demo c"}, "if"},
             {:name, %{scope: ["source.c"], language: "demo c"}, " foo {}"}
           ]

    assert %{name: "Demo C", codeblock_name: "demo_c"} =
             MakeupSyntect.Syntaxes.all() |> Enum.find(&(&1.name == "Demo C"))
  end
end
