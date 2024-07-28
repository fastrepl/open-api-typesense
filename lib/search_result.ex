defmodule Typesense.SearchResult do
  @moduledoc """
  Provides struct and type for a SearchResult
  """
  use Typesense.Encoder

  @type t :: %__MODULE__{
          facet_counts: [Typesense.FacetCounts.t()] | nil,
          found: integer | nil,
          grouped_hits: [Typesense.SearchGroupedHit.t()] | nil,
          hits: [Typesense.SearchResultHit.t()] | nil,
          out_of: integer | nil,
          page: integer | nil,
          request_params: Typesense.SearchResultRequestParams.t() | nil,
          search_cutoff: boolean | nil,
          search_time_ms: integer | nil
        }

  defstruct [
    :facet_counts,
    :found,
    :grouped_hits,
    :hits,
    :out_of,
    :page,
    :request_params,
    :search_cutoff,
    :search_time_ms
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      facet_counts: [{Typesense.FacetCounts, :t}],
      found: :integer,
      grouped_hits: [{Typesense.SearchGroupedHit, :t}],
      hits: [{Typesense.SearchResultHit, :t}],
      out_of: :integer,
      page: :integer,
      request_params: {Typesense.SearchResultRequestParams, :t},
      search_cutoff: :boolean,
      search_time_ms: :integer
    ]
  end
end
