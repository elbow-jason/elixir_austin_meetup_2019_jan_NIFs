defmodule SimpleRustNif.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_rust_nif,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates()
    ]
  end

  defp rustler_crates do
    [
      simple_rust_nif: [
        path: "native/simplerustnif_native",
        mode: if(Mix.env() == :prod, do: :release, else: :debug)
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.18.0"}
    ]
  end
end
