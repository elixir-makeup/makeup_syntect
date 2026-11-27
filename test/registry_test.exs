defmodule MakeupSyntect.RegistryTest do
  use ExUnit.Case, async: true

  alias Makeup.Registry

  test "registers syntax names and codeblock names" do
    assert {:ok, {MakeupSyntect.Lexer, [language: "Lean 4"]}} =
             Registry.fetch_lexer_by_name("lean_4")

    assert {:ok, {MakeupSyntect.Lexer, [language: "Lean 4"]}} =
             Registry.fetch_lexer_by_name("Lean 4")
  end

  test "registers file extensions as names" do
    assert {:ok, {MakeupSyntect.Lexer, [language: "Lean 4"]}} =
             Registry.fetch_lexer_by_name("lean")

    assert {:ok, {MakeupSyntect.Lexer, [language: "Rust"]}} = Registry.fetch_lexer_by_name("rs")
  end

  test "syntax names take precedence over file extensions" do
    # The C++ syntax also lists the "c" extension.
    assert {:ok, {MakeupSyntect.Lexer, [language: "C"]}} = Registry.fetch_lexer_by_name("c")
    # The HTML (ASP) syntax lists the "asp" extension.
    assert {:ok, {MakeupSyntect.Lexer, [language: "ASP"]}} = Registry.fetch_lexer_by_name("asp")
  end

  test "does not register file extensions of excluded syntaxes" do
    refute match?({:ok, {MakeupSyntect.Lexer, _}}, Registry.fetch_lexer_by_name("ex"))
    refute match?({:ok, {MakeupSyntect.Lexer, _}}, Registry.fetch_lexer_by_name("erl"))
  end
end
