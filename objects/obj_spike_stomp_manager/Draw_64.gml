if !obj_game_manager.gameStarted {
	return;
}

draw_sprite_ext(spr_health_radial, obj_game_manager.p1Health, 75, 70, 2, 2, 0, c_black, 1);
draw_sprite_ext(spr_health_radial, obj_game_manager.p2Health, 225, 70, 2, 2, 0, c_red, 1);
draw_sprite_ext(spr_health_radial, obj_game_manager.p3Health, 375, 70, 2, 2, 0, c_green, 1);
draw_sprite_ext(spr_health_radial, obj_game_manager.p4Health, 525, 70, 2, 2, 0, c_yellow, 1);