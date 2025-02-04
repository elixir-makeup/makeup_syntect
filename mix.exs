defmodule MakeupSyntect.MixProject do
  use Mix.Project

  def project do
    [
      app: :makeup_syntect,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        main: "readme",
        extras: Path.wildcard("examples/*.md") ++ ["README.md"],
        source_url: "https://github.com/SteffenDE/makeup_syntect"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {MakeupSyntect.Application, []}
    ]
  end

  def cli do
    [preferred_envs: [docs: :docs]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.36.1", runtime: false},
      {:makeup, "~> 1.2"},
      {:ex_doc, "~> 0.34", only: :docs, runtime: false}
    ]
  end
end
