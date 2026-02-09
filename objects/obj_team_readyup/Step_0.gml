if obj_game_manager.teamNums[0] + 
obj_game_manager.teamNums[1] + 
obj_game_manager.teamNums[2] + 
obj_game_manager.teamNums[3] == 6 {
	teamsReady = true;
	visible = true;
}
else {
	teamsReady = false;
	visible = false;
}