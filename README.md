# Typesense Elixir Client

## Installation

```elixir
def deps do
  [
    {:oapi_typesense, git: "https://github.com/fastrepl/open-api-typesense.git", branch: "main"}
  ]
end
```

```elixir
# config/runtime.exs
config :oapi_typesense,
  base_url: System.get_env("TYPESENSE_URL"),
  api_key: System.get_env("TYPESENSE_API_KEY")
```

## Keep Client up to date

```bash
git submodule update --remote && mix api.gen default typesense-api-spec/openapi.yml
```
