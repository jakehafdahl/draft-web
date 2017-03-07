defmodule DraftWeb.Controller do
	defmacro __using__ do
		def controller do
			quote do
				require EEx
				require Logger

				import DraftWeb.Helpers
			end
		end
	end
end