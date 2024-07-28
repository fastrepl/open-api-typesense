import Config

config :oapi_generator,
  default: [
    output: [
      location: "lib/",
      base_module: Typesense,
      schema_use: Typesense.Encoder,
      default_client: Typesense.Client
    ]
  ]
