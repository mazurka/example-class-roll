defmodule ClassRoll.Mixfile do
  use Mix.Project

  def project do
    [app: :class_roll,
     version: "0.1.0",
     elixir: "~> 1.0",
     compilers: Mix.compilers,
     deps: deps,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod]
  end

  ####
  # Applications
  ####

  def application do
    [
      mod: { ClassRoll, [] },
      applications: [
        :cowboy,
        :logger,
      ] ++ (Mix.env == :dev && dev_applications || [])
    ]
  end

  defp dev_applications do
    [:rl,]
  end

  ####
  # Deps
  ####

  defp deps do
    [{ :cowboy, "1.0.0" },
     { :ecto, "~> 1.0.0" },
     { :etude, "~> 0.3.0" },
     { :mazurka, github: "mazurka/mazurka" },
     # { :mazurka, "~> 0.3.0" },
     { :parse_trans, github: "uwiger/parse_trans" },
     { :parse_trans, github: "uwiger/parse_trans" },
     { :plug, "~> 0.13.0" },
     { :plug_wait1, "~> 0.1.2" },
     { :poison, "1.4.0", override: true },
     { :postgrex, ">= 0.0.0" },
     { :rl, github: "camshaft/rl", only: :dev },
     { :simple_env, github: "camshaft/simple_env" },]
  end
end
