defmodule Typesense.Encoder do
  defmacro __using__(_opts) do
    quote do
      defimpl Jason.Encoder, for: __MODULE__ do
        def encode(struct, opts) do
          struct
          |> Map.from_struct()
          |> Map.reject(fn {_k, v} -> is_nil(v) end)
          |> Jason.Encode.map(opts)
        end
      end
    end
  end
end
