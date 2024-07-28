defmodule Typesense.SearchOverrideRule do
  @moduledoc """
  Provides struct and type for a SearchOverrideRule
  """
  use Typesense.Encoder

  @type t :: %__MODULE__{match: String.t(), query: String.t(), tags: [String.t()] | nil}

  defstruct [:match, :query, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [match: {:enum, ["exact", "contains"]}, query: {:string, :generic}, tags: [string: :generic]]
  end
end
