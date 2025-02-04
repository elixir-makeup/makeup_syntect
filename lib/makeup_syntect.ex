defmodule MakeupSyntect do
  @moduledoc """
  MakeupSyntect is an adapter for Makeup, providing syntax highlighting using the [syntect](https://docs.rs/syntect/latest/syntect/) Rust library.

  More syntax definitions are included using [two-face](https://docs.rs/two-face/latest/two_face/).

  For a list of supported langugages, see: `MakeupSyntect.Syntaxes`.
  """

  use Rustler, otp_app: :makeup_syntect, crate: "makeup_syntect"

  @doc """
  Tokenizes the given text using syntect.

  ## Parameters
    - text: The source code text to tokenize
    - opts: Optional keyword list of options
      - language: Optional language identifier (e.g. "rust", "html", "javascript")
  """
  def tokenize(text, opts \\ []) do
    language = Keyword.get(opts, :language)
    syntax_folder = Keyword.get(opts, :syntax_folder)
    do_tokenize(text, language, syntax_folder)
  end

  @doc false
  def supported_syntaxes(), do: :erlang.nif_error(:nif_not_loaded)

  # NIF implementations
  @doc false
  def do_tokenize(_text, _language, _syntax_folder), do: :erlang.nif_error(:nif_not_loaded)
end
