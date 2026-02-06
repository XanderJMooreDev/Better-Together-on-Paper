image_blend = obj_game_manager.teamColor1;

if (obj_game_manager.teamNums[0] == 1) {
	sprite_index = ds_list_find_value(obj_game_manager.playerHats, obj_game_manager.playerHatIDs[1]); 
}
else if (obj_game_manager.teamNums[1] == 1) {
	sprite_index = ds_list_find_value(obj_game_manager.playerHats, obj_game_manager.playerHatIDs[2]); 
}
else if (obj_game_manager.teamNums[2] == 1) {
	sprite_index = ds_list_find_value(obj_game_manager.playerHats, obj_game_manager.playerHatIDs[3]); 
}

// Tall hats
if sprite_index == spr_hat_crown {
	y = 584;
}
else {
	y = 600;
}