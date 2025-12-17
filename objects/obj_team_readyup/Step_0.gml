if obj_game_manager.player1Team + 
obj_game_manager.player2Team + 
obj_game_manager.player3Team + 
obj_game_manager.player4Team == 6 {
	teamsReady = true;
	visible = true;
}
else {
	teamsReady = false;
	visible = false;
}