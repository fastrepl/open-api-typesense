defmodule Typesense.PresetsRetrieveSchema do
  @moduledoc """
  Provides struct and type for a PresetsRetrieveSchema
  """

  @type t :: %__MODULE__{presets: [Typesense.PresetSchema.t()]}

  defstruct [:presets]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [presets: [{Typesense.PresetSchema, :t}]]
  end
end
