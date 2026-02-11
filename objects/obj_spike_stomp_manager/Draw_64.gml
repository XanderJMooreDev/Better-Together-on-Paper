if !obj_game_manager.gameStarted {
	return;
}

draw_sprite_ext(spr_health_radial, obj_game_manager.healths[0], 75, 70, 2, 2, 0, c_black, 1);
draw_sprite_ext(spr_health_radial, obj_game_manager.healths[1], 225, 70, 2, 2, 0, c_red, 1);
draw_sprite_ext(spr_health_radial, obj_game_manager.healths[2], 375, 70, 2, 2, 0, c_green, 1);
draw_sprite_ext(spr_health_radial, obj_game_manager.healths[3], 525, 70, 2, 2, 0, c_yellow, 1);