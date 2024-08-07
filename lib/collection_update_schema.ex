defmodule Typesense.CollectionUpdateSchema do
  @moduledoc """
  Provides struct and type for a CollectionUpdateSchema
  """
  use Typesense.Encoder

  @type t :: %__MODULE__{fields: [Typesense.Field.t()]}

  defstruct [:fields]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fields: [{Typesense.Field, :t}]]
  end
end
