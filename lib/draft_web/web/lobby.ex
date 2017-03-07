defmodule DraftWeb.LobbyController do
	use Plug.Router
	import DraftWeb.Helpers
	require EEx

	plug :match
	plug :dispatch

	use DraftWeb.View

	get "/new" do
		send_resp(conn, 200, render("lobby/index.eex", []))
	end

	post "/create" do
		%{ "draft_name" => draft_name, "num_teams" => num_teams, "settings" => settings} = conn.params

		# options = parse_settings(settings)
		# Do something to generate a unique id for a draft and call the orchestration
		Draft.Orchestrator.start_draft(draft_name, num_teams, Map.to_list(string_map_to_atom(settings)))

		conn
    	|> send_resp(200, "/lobby/#{draft_name}")
	end

	get "/:lobby_name" do
		_draft_pid = Draft.Lobby.get_pid(lobby_name)

		send_resp(conn, 200, render("lobby/join.eex", lobby: lobby_name))
	end

	match _ do
		send_resp(conn, 404, "Oops!... Not Found dummy")
	end

end
