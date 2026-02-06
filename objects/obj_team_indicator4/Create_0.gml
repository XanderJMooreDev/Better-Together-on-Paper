if (obj_game_manager.teamNums[0] == 2 && obj_game_manager.teamNums[1] == 2) {
	image_blend = make_color_rgb(255, 0, 0);
}
else if (obj_game_manager.teamNums[1] == 2 && obj_game_manager.teamNums[2] == 2 || obj_game_manager.player1Team == 2 && obj_game_manager.player3Team == 2 ) {
	image_blend = make_color_rgb(0, 196, 55);
}
else if (obj_game_manager.teamNums[0] == 2 && obj_game_manager.teamNums[3] == 2 || obj_game_manager.player2Team == 2 && obj_game_manager.player4Team == 2 || obj_game_manager.player3Team == 2 && obj_game_manager.player4Team == 2) {
	image_blend = make_color_rgb(255, 255, 0);
}