defmodule Typesense.Field do
  @moduledoc """
  Provides struct and type for a Field
  """
  use Typesense.Encoder

  @type t :: %__MODULE__{
          drop: boolean | nil,
          embed: Typesense.FieldEmbed.t() | nil,
          facet: boolean | nil,
          index: boolean | nil,
          infix: boolean | nil,
          locale: String.t() | nil,
          name: String.t(),
          num_dim: integer | nil,
          optional: boolean | nil,
          reference: String.t() | nil,
          sort: boolean | nil,
          type: String.t(),
          stem: boolean | nil
        }

  defstruct [
    :drop,
    :embed,
    :facet,
    :index,
    :infix,
    :locale,
    :name,
    :num_dim,
    :optional,
    :reference,
    :sort,
    :type,
    :stem
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      drop: :boolean,
      embed: {Typesense.FieldEmbed, :t},
      facet: :boolean,
      index: :boolean,
      infix: :boolean,
      locale: {:string, :generic},
      name: {:string, :generic},
      num_dim: :integer,
      optional: :boolean,
      reference: {:string, :generic},
      sort: :boolean,
      type: {:string, :generic},
      stem: :boolean
    ]
  end
end
