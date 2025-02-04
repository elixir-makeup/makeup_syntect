defmodule MakeupSyntect.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias Makeup.Registry

  @impl true
  def start(_type, _args) do
    for %{name: name, codeblock_name: sanitized_name, extensions: extensions} <-
          MakeupSyntect.Syntaxes.all() do
      Registry.register_lexer(MakeupSyntect.Lexer,
        options: [language: name],
        names: [name, sanitized_name],
        extensions: extensions
      )
    end

    children = []

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MakeupSyntect.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
