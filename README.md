# DraftWeb

**Purpose**
To wrap the draft OTP application

## API

GET "/lobby/new"
use this to get to the html page that lets you configure a new draft

POST "/lobby/create"
use this to create a draft lobby with the given configuration

takes there arguments

returns

GET /lobby/<lobby_id>
will bring you to a page to join the draft

GET /lobby/<lobby_id>/participant/<participant_id>
will bring you to a page which will be the draft for a given particpant

POST /lobby/<lobby_id>/participant/<participant_id>/start_draft
will begin the draft for all pericipants in the lobby, 
can only be done by the participant that created the lobby

POST /lobby/<lobby_id>/participant/<participant_id>/draft_player

POST /lobby/<lobby_id>/participant/<participant_id>/update_watchlist

POST /lobby/<lobby_id>/participant/<participant_id>/update_projection