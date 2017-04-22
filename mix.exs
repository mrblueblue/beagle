defmodule Beagle.Mixfile do
  use Mix.Project

  def project do
    [
      app: :beagle,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      name: "Beagle",
      source_url: "https://github.com/mrblueblue/beagle"
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :hound]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:hound, "~> 1.0"}]
  end

  defp description do
   """
   Add-ons for the Hound, the integration testing and browser automation library
   """
 end

 defp package do
   # These are the default files included in the package
   [
     name: :postgrex,
     files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Jonathan Huang"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/mrblueblue/beagle"}
   ]
 end
end
