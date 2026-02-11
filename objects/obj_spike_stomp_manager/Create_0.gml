image_alpha = 0;

check_if_team_wins = function(playerA, playerB, playerATeam, playerBTeam) {
	if !obj_game_manager.gameStarted {
		return;
	}
	
	if place_meeting(x, y, playerA) &&
	place_meeting(x,y, playerB) &&
	playerATeam == playerBTeam {
		if playerATeam == 2 {
			obj_game_manager.team1Score++;
		}
		else {
			obj_game_manager.team2Score++;
		}
	
		obj_game_manager.gameStarted = false;
	
		obj_flag.celebration = 1;
		obj_flag.countdownTime = 6;
		
		if playerATeam == 1 {
			obj_flag.lastWinner = 2;
			obj_flag.locate_players(2);
		}
		else {
			obj_flag.lastWinner = 1;
			obj_flag.locate_players(1);
		}
	}
}

gm = obj_game_manager;
im = obj_instance_manager;

check_for_winner = function() {
	teamMembersCounted = [ 0, 0 ];
	
	for (i = 0; i < array_length(im.players); i++) {
		if place_meeting(x, y, im.players[i]) {
			teamMembersCounted[gm.teamNums[i] - 1]++;
		}
		
		if (teamMembersCounted[0] == 2 || teamMembersCounted[1] == 2) {
			if teamMembersCounted[1] == 2 {
				gm.team1Score++;
			}
			else {
				gm.team2Score++;
			}
	
			gm.gameStarted = false;
	
			obj_flag.celebration = 1;
			obj_flag.countdownTime = 6;
		
			if teamMembersCounted[0] == 2 {
				obj_flag.lastWinner = 2;
				obj_flag.locate_players(2);
			}
			else {
				obj_flag.lastWinner = 1;
				obj_flag.locate_players(1);
			}
		}
	}
}