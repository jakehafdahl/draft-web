defmodule DraftWeb.Router do
	use Plug.Router
	require EEx
	require Logger

	plug Plug.Static,
		at: "/public",
		from: "web/public"

	plug Plug.Parsers,  parsers: [:json],
						pass: ["application/json"],
						json_decoder: Poison
	plug :match
	plug :dispatch


	use DraftWeb.View

	get "/" do
		drafts = Draft.Orchestrator.list_drafts
		
		send_resp(conn, 200, render("index.eex", drafts: drafts, layout: "/layout.eex"))
	end

	forward "/lobby", to: DraftWeb.LobbyController

	match _ do
		send_resp(conn, 404, "Oops!... Not Found dummy")
	end
end