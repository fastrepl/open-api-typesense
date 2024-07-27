defmodule Typesense.PresetSchema do
  @moduledoc """
  Provides struct and type for a PresetSchema
  """

  @type t :: %__MODULE__{
          name: String.t() | nil,
          value: Typesense.MultiSearchSearchesParameter.t() | Typesense.SearchParameters.t() | nil
        }

  defstruct [:name, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: {:string, :generic},
      value:
        {:union, [{Typesense.MultiSearchSearchesParameter, :t}, {Typesense.SearchParameters, :t}]}
    ]
  end
end
