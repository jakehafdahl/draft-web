defmodule DraftWeb.Router do
	use Plug.Router
	require EEx
	require Logger

	plug :match
	plug :dispatch

	EEx.function_from_file :defp, :home_index, "web/templates/index.eex", [:drafts]
	get "/" do
		drafts = Draft.Orchestrator.list_drafts
		content = home_index(drafts)
		send_resp(conn, 200, content)
	end

	match _ do
		send_resp(conn, 404, "Oops!... Not Found dummy")
	end
end