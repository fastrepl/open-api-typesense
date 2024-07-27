defmodule Typesense.Presets do
  @moduledoc """
  Provides API endpoints related to presets
  """

  @default_client Typesense.Client

  @doc """
  Delete a preset.

  Permanently deletes a preset, given it's name.
  """
  @spec delete_preset(String.t(), keyword) ::
          {:ok, Typesense.PresetDeleteSchema.t()} | {:error, Typesense.ApiResponse.t()}
  def delete_preset(presetId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [presetId: presetId],
      call: {Typesense.Presets, :delete_preset},
      url: "/presets/#{presetId}",
      method: :delete,
      response: [{200, {Typesense.PresetDeleteSchema, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves all presets.

  Retrieve the details of all presets
  """
  @spec retrieve_all_presets(keyword) :: {:ok, Typesense.PresetsRetrieveSchema.t()} | :error
  def retrieve_all_presets(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Typesense.Presets, :retrieve_all_presets},
      url: "/presets",
      method: :get,
      response: [{200, {Typesense.PresetsRetrieveSchema, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a preset.

  Retrieve the details of a preset, given it's name.
  """
  @spec retrieve_preset(String.t(), keyword) ::
          {:ok, Typesense.PresetSchema.t()} | {:error, Typesense.ApiResponse.t()}
  def retrieve_preset(presetId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [presetId: presetId],
      call: {Typesense.Presets, :retrieve_preset},
      url: "/presets/#{presetId}",
      method: :get,
      response: [{200, {Typesense.PresetSchema, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Upserts a preset.

  Create or update an existing preset.
  """
  @spec upsert_preset(String.t(), Typesense.PresetUpsertSchema.t(), keyword) ::
          {:ok, Typesense.PresetSchema.t()} | {:error, Typesense.ApiResponse.t()}
  def upsert_preset(presetId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [presetId: presetId, body: body],
      call: {Typesense.Presets, :upsert_preset},
      url: "/presets/#{presetId}",
      body: body,
      method: :put,
      request: [{"application/json", {Typesense.PresetUpsertSchema, :t}}],
      response: [{200, {Typesense.PresetSchema, :t}}, {400, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end
end
