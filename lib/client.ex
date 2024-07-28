defmodule Typesense.Client do
  defp api_key, do: Application.fetch_env!(:oapi_typesense, :api_key)
  defp base_url, do: Application.fetch_env!(:oapi_typesense, :base_url)

  def request(%{url: url, method: method} = input) do
    body_param =
      if is_map(input[:body]) do
        [json: input[:body]]
      else
        [body: input[:body]]
      end

    req =
      Req.new(
        base_url: base_url(),
        url: url,
        method: method,
        headers: [{"X-TYPESENSE-API-KEY", api_key()}],
        params: input[:opts]
      )
      |> Req.merge(body_param)

    case Req.request(req) do
      {:ok, res} -> decode_response(res, input)
      error -> error
    end
  end

  defp decode_response(%{status: status, body: body} = res, input) do
    flag = if status >= 300, do: :error, else: :ok

    case Enum.find(input[:response], fn {code, _} -> code == status end) do
      {_, :map} ->
        {flag, body}

      {_, {:string, :generic}} ->
        {flag, body}

      {_, {module, type}} when is_atom(type) ->
        if function_exported?(module, :__struct__, 0) do
          {flag, to_struct(module, body)}
        else
          {flag, body}
        end

      nil ->
        {:error, res}
    end
  end

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
