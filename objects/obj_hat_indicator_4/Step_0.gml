image_blend = obj_game_manager.teamColor2;

if (obj_game_manager.player1Team == 2 && obj_game_manager.player2Team == 2) {
	sprite_index = ds_list_find_value(obj_game_manager.playerHats, obj_game_manager.playerHatIDs[2]);
}
else if (obj_game_manager.player2Team == 2 && obj_game_manager.player3Team == 2 || obj_game_manager.player1Team == 2 && obj_game_manager.player3Team == 2 ) {
	sprite_index = ds_list_find_value(obj_game_manager.playerHats, obj_game_manager.playerHatIDs[3]);
}
else if (obj_game_manager.player1Team == 2 && obj_game_manager.player4Team == 2 || obj_game_manager.player2Team == 2 && obj_game_manager.player4Team == 2 || obj_game_manager.player3Team == 2 && obj_game_manager.player4Team == 2) {
	sprite_index = ds_list_find_value(obj_game_manager.playerHats, obj_game_manager.playerHatIDs[4]);
}

// Tall hats
if sprite_index == spr_hat_crown {
	y = 584;
}
else {
	y = 600;
}