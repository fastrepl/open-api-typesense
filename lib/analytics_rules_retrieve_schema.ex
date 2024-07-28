defmodule Typesense.AnalyticsRulesRetrieveSchema do
  @moduledoc """
  Provides struct and type for a AnalyticsRulesRetrieveSchema
  """
  use Typesense.Encoder

  @type t :: %__MODULE__{rules: [Typesense.AnalyticsRuleSchema.t()] | nil}

  defstruct [:rules]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rules: [{Typesense.AnalyticsRuleSchema, :t}]]
  end
end
