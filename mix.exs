defmodule Cosgoda.MixProject do
  use Mix.Project

  def project do
    [
      app: :cosgoda,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Cosgoda.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:argon2_elixir, "~> 1.3"},
      {:absinthe, "~> 1.4.0"},
      {:absinthe_plug, "~> 1.4"},
      {:comeonin, "~> 4.1"},
      {:ecto_sql, "~> 3.0"},
      {:gettext, "~> 0.11"},
      {:guardian, "~> 1.0"},
      {:mix_test_watch, "~> 0.8", only: :dev, runtime: false},
      {:phoenix, "~> 1.4.0"},
      {:phoenix_pubsub, "~> 1.1"},
      {:phoenix_ecto, "~> 4.0"},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 3.1"},
      {:postgrex, ">= 0.0.0"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
