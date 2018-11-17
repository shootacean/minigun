defmodule Minigun.MixProject do
  use Mix.Project

  def project do
    [
      app: :minigun,
      escript: [
        main_module: Minigun.Cli
      ],
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :dev,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:logger_file_backend, git: "https://github.com/onkel-dirtus/logger_file_backend"},
      {:httpoison, "~> 1.4"},
      {:poison, "~> 4.0"},
      {:flow, "~> 0.14.3"},
    ]
  end
end
