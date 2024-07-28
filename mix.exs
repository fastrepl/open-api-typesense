defmodule OapiTypesense.MixProject do
  use Mix.Project

  def project do
    [
      app: :oapi_typesense,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:oapi_generator, "~> 0.2.0", only: :dev, runtime: false},
      {:req, "~> 0.5.0"}
    ]
  end

  defp package do
    [
      name: "oapi_typesense"
    ]
  end
end
