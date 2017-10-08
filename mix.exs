defmodule Msg91.Mixfile do
  use Mix.Project

  def project do
    [
      app: :msg91,
      version: "0.1.0",
      elixir: "~> 1.5",
      description: "MSG91 API library for Elixir",
      source_url: "https://github.com/sasankyadavalli/msg91",
      package: package(),
      start_permanent: Mix.env == :prod,
      deps: deps()
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
      {:httpoison, "~> 0.13"},
      {:ex_doc, "~> 0.17.1", only: [:dev, :test]}
    ]
  end

  defp description() do
    "MSG91 API client for Elixir"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "msg91",
      # These are the default files included in the package
      maintainers: ["Sasank Yadavalli"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sasankyadavalli/msg91"}
    ]
  end
end
