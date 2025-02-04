defmodule MakeupSyntect.Syntaxes do
  @moduledoc """
  This module provides a list of supported syntax definitions.

  #{MakeupSyntect.supported_syntaxes() |> Enum.sort_by(& &1.name) |> Enum.map(&"  * #{&1.name}") |> Enum.join("\n")}
  """

  @doc """
  Returns a list of all supported syntax definitions.

  Returns a list of maps containing:
    - name: The name of the syntax (e.g. "HTML", "JavaScript")
    - file_extensions: List of file extensions (e.g. ["html", "htm"])

  ## Example

      iex> MakeupSyntect.Syntaxes.all()
      [
        %{name: "Plain Text", extensions: ["txt"], codeblock_name: "plain_text"},
        %{name: "ASP", extensions: ["asa"], codeblock_name: "asp"},
        %{name: "HTML (ASP)", extensions: ["asp"], codeblock_name: "html_asp"},
        %{name: "ActionScript", extensions: ["as"], codeblock_name: "actionscript"}
        ...
      ]

  """
  def all do
    for %{name: name, file_extensions: file_extensions} <- MakeupSyntect.supported_syntaxes() do
      sanitized_name =
        String.split(name, [" ", "(", ")"], trim: true) |> Enum.join("_") |> String.downcase()

      %{name: name, codeblock_name: sanitized_name, extensions: file_extensions}
    end
  end
end
