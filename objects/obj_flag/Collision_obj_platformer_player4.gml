if obj_game_manager.gameStarted {
	if obj_game_manager.player4Team == 1 {
		obj_game_manager.team1Score++;
	}
	else {
		obj_game_manager.team2Score++;
	}
	obj_game_manager.gameStarted = false;
	
	lastWinner = obj_game_manager.player4Team;
	celebration = 1;
	countdownTime = 6;
	
	locate_players(obj_game_manager.player4Team);
}