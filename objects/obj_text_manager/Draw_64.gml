if room == room_game_menu {
	draw_set_halign(fa_center);
	draw_set_color(obj_game_manager.teamColor1);
	draw_text_transformed(96, 644, obj_game_manager.team1Score, 2, 2, 0);
	draw_set_color(obj_game_manager.teamColor2);
	draw_text_transformed(288, 644, obj_game_manager.team2Score, 2, 2, 0);
	draw_set_color(make_color_rgb(0,0,0));
	draw_text_transformed(192, 520, "Team Selection", 2, 2, 0);
}