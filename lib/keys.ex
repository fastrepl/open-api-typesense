defmodule Typesense.Keys do
  @moduledoc """
  Provides API endpoints related to keys
  """

  @default_client Typesense.Client

  @doc """
  Create an API Key

  Create an API Key with fine-grain access control. You can restrict access on both a per-collection and per-action level. The generated key is returned only during creation. You want to store this key carefully in a secure place.
  """
  @spec create_key(Typesense.ApiKeySchema.t(), keyword) ::
          {:ok, Typesense.ApiKey.t()} | {:error, Typesense.ApiResponse.t()}
  def create_key(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Typesense.Keys, :create_key},
      url: "/keys",
      body: body,
      method: :post,
      request: [{"application/json", {Typesense.ApiKeySchema, :t}}],
      response: [
        {201, {Typesense.ApiKey, :t}},
        {400, {Typesense.ApiResponse, :t}},
        {409, {Typesense.ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an API key given its ID.
  """
  @spec delete_key(integer, keyword) ::
          {:ok, Typesense.ApiKey.t()} | {:error, Typesense.ApiResponse.t()}
  def delete_key(keyId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [keyId: keyId],
      call: {Typesense.Keys, :delete_key},
      url: "/keys/#{keyId}",
      method: :delete,
      response: [
        {200, {Typesense.ApiKey, :t}},
        {400, {Typesense.ApiResponse, :t}},
        {404, {Typesense.ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieve (metadata about) a key

  Retrieve (metadata about) a key. Only the key prefix is returned when you retrieve a key. Due to security reasons, only the create endpoint returns the full API key.
  """
  @spec get_key(integer, keyword) ::
          {:ok, Typesense.ApiKey.t()} | {:error, Typesense.ApiResponse.t()}
  def get_key(keyId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [keyId: keyId],
      call: {Typesense.Keys, :get_key},
      url: "/keys/#{keyId}",
      method: :get,
      response: [{200, {Typesense.ApiKey, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve (metadata about) all keys.
  """
  @spec get_keys(keyword) :: {:ok, Typesense.ApiKeysResponse.t()} | :error
  def get_keys(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Typesense.Keys, :get_keys},
      url: "/keys",
      method: :get,
      response: [{200, {Typesense.ApiKeysResponse, :t}}],
      opts: opts
    })
  end
end
