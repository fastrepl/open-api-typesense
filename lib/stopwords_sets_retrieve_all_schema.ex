defmodule Typesense.StopwordsSetsRetrieveAllSchema do
  @moduledoc """
  Provides struct and type for a StopwordsSetsRetrieveAllSchema
  """
  use Typesense.Encoder

  @type t :: %__MODULE__{stopwords: [Typesense.StopwordsSetSchema.t()]}

  defstruct [:stopwords]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [stopwords: [{Typesense.StopwordsSetSchema, :t}]]
  end
end
