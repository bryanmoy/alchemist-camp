defmodule StatWatch.MixProject do
  use Mix.Project

  def column_names() do
    Enum.join(~w(DateTime Subscribers Videos Views), ",")
  end

  def project do
    [
      app: :stat_watch,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {StatWatch.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.5"},
      {:poison, "~> 3.1"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 2.2"}
    ]
  end
end
