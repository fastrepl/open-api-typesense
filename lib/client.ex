defmodule Typesense.Client do
  defp api_key, do: Application.fetch_env!(:oapi_typesense, :api_key)
  defp base_url, do: Application.fetch_env!(:oapi_typesense, :base_url)

  def request(%{
        url: url,
        method: method,
        body: body,
        response: response_schemas
      }) do
    result =
      Req.new(
        base_url: base_url(),
        url: url,
        method: method,
        headers: [{"X-TYPESENSE-API-KEY", api_key()}],
        json: body
      )
      |> Req.request()

    case result do
      {:ok, res} -> handle_response(res, response_schemas)
      error -> error
    end
  end

  defp handle_response(%{status: status, body: body} = res, response_schemas) do
    flag = if status >= 300, do: :error, else: :ok

    case Enum.find(response_schemas, fn {code, _} -> code == status end) do
      {_, {module, :t}} -> {flag, to_struct(module, body)}
      {_, :map} -> {flag, body}
      _ -> {:error, res}
    end
  end

  @spec to_struct(atom() | struct(), any()) :: any()
  def to_struct(kind, attrs) do
    struct = struct(kind)

    Enum.reduce(Map.to_list(struct), struct, fn {k, _}, acc ->
      case Map.fetch(attrs, Atom.to_string(k)) do
        {:ok, v} -> %{acc | k => v}
        :error -> acc
      end
    end)
  end
end
