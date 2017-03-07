"use strict";

(function($jq){

	var submitBtn = $jq('#submit');

	submitBtn.click(function(){
		// get params into json object
		var options = {
			draft_name: "Northern Nightmare",
			num_teams: 12,
			settings: {
				scoring_settings: [
					{
						position: 'RB', 
						field: "rush_td", 
						required_amt: 1, 
						points_for: 6, 
						continuous: true
					},
					{
						position: 'RB', 
						field: "rush_yards", 
						required_amt: 1, 
						points_for: 6, 
						continuous: true
					},
					{
						position: 'RB', 
						field: "rec_td", 
						required_amt: 1, 
						points_for: 6, 
						continuous: true
					},
					{
						position: 'RB', 
						field: "rec_yards", 
						required_amt: 1, 
						points_for: 6, 
						continuous: true
					}],
				roster_settings: {
					"QB": ["QB"],
					"RB1": ["RB"],
					"RB2": ["RB"],
					"WR1": ["WR"],
					"WR2": ["WR"],
					"FLEX": ["RB", "WR", "TE"],
					"TE": ["TE"],
					"K": ["K"],
					"DST": ["DST"],
					"BENCH1": ["QB", "RB", "WR", "TE", "K", "DST"],
					"BENCH2": ["QB", "RB", "WR", "TE", "K", "DST"],
					"BENCH3": ["QB", "RB", "WR", "TE", "K", "DST"],
					"BENCH4": ["QB", "RB", "WR", "TE", "K", "DST"],
					"BENCH5": ["QB", "RB", "WR", "TE", "K", "DST"],
					"BENCH6": ["QB", "RB", "WR", "TE", "K", "DST"],
					"BENCH7": ["QB", "RB", "WR", "TE", "K", "DST"]
				}
			}
		};

		Draft.postJSON('/lobby/create', options).then(function(data){
				console.log("success in then");
				// follow path to get to draft page
			}
		);
	});

}(jQuery));