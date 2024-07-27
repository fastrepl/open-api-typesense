defmodule Typesense.Analytics do
  @moduledoc """
  Provides API endpoints related to analytics
  """

  @default_client Typesense.Client

  @doc """
  Creates an analytics rule

  When an analytics rule is created, we give it a name and describe the type, the source collections and the destination collection.
  """
  @spec create_analytics_rule(Typesense.AnalyticsRuleSchema.t(), keyword) ::
          {:ok, Typesense.AnalyticsRuleSchema.t()} | {:error, Typesense.ApiResponse.t()}
  def create_analytics_rule(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Typesense.Analytics, :create_analytics_rule},
      url: "/analytics/rules",
      body: body,
      method: :post,
      request: [{"application/json", {Typesense.AnalyticsRuleSchema, :t}}],
      response: [{201, {Typesense.AnalyticsRuleSchema, :t}}, {400, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete an analytics rule

  Permanently deletes an analytics rule, given it's name
  """
  @spec delete_analytics_rule(String.t(), keyword) ::
          {:ok, Typesense.AnalyticsRuleSchema.t()} | {:error, Typesense.ApiResponse.t()}
  def delete_analytics_rule(ruleName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ruleName: ruleName],
      call: {Typesense.Analytics, :delete_analytics_rule},
      url: "/analytics/rules/#{ruleName}",
      method: :delete,
      response: [{200, {Typesense.AnalyticsRuleSchema, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves an analytics rule

  Retrieve the details of an analytics rule, given it's name
  """
  @spec retrieve_analytics_rule(String.t(), keyword) ::
          {:ok, Typesense.AnalyticsRuleSchema.t()} | {:error, Typesense.ApiResponse.t()}
  def retrieve_analytics_rule(ruleName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ruleName: ruleName],
      call: {Typesense.Analytics, :retrieve_analytics_rule},
      url: "/analytics/rules/#{ruleName}",
      method: :get,
      response: [{200, {Typesense.AnalyticsRuleSchema, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves all analytics rules

  Retrieve the details of all analytics rules
  """
  @spec retrieve_analytics_rules(keyword) ::
          {:ok, Typesense.AnalyticsRulesRetrieveSchema.t()} | :error
  def retrieve_analytics_rules(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Typesense.Analytics, :retrieve_analytics_rules},
      url: "/analytics/rules",
      method: :get,
      response: [{200, {Typesense.AnalyticsRulesRetrieveSchema, :t}}],
      opts: opts
    })
  end

  @doc """
  Upserts an analytics rule

  Upserts an analytics rule with the given name.
  """
  @spec upsert_analytics_rule(String.t(), Typesense.AnalyticsRuleSchema.t(), keyword) ::
          {:ok, Typesense.AnalyticsRuleSchema.t()} | {:error, Typesense.ApiResponse.t()}
  def upsert_analytics_rule(ruleName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [ruleName: ruleName, body: body],
      call: {Typesense.Analytics, :upsert_analytics_rule},
      url: "/analytics/rules/#{ruleName}",
      body: body,
      method: :put,
      request: [{"application/json", {Typesense.AnalyticsRuleSchema, :t}}],
      response: [{201, {Typesense.AnalyticsRuleSchema, :t}}, {400, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end
end
