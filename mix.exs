defmodule Credo.Mixfile do
  use Mix.Project

  def project do
    [
      app: :credo,
      version: "0.9.1",
      elixir: ">= 1.4.0",
      escript: [main_module: Credo.CLI],
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: Coverex.Task],
      name: "Credo",
      description: "A static code analysis tool with a focus on code consistency and teaching.",
      package: package(),
      source_url: "https://github.com/rrrene/credo",
      # The main page in the docs
      docs: [main: "Credo", logo: "assets/logo.png", extras: ["README.md"]]
    ]
  end

  defp package do
    [
      files: [
        ".credo.exs",
        ".template.check.ex",
        "lib",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      maintainers: ["René Föhring"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/rrrene/credo"}
    ]
  end

  def application do
    [mod: {Credo.Application, []}, applications: [:bunt, :logger, :inets]]
  end

  defp deps do
    [
      {:bunt, "~> 0.2.0"},
      {:poison, ">= 0.0.0"},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end
end
