defmodule DraftWeb.Helpers do
	require Logger

	def string_map_to_atom(map) do
		map |> Enum.reduce(%{}, fn ({key, val}, acc) -> Map.put(acc, String.to_atom(key), val) end)
	end
end