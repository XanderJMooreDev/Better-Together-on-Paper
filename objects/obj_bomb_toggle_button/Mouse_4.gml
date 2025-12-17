if mouseHovering {
	obj_game_manager.bombsOn = !obj_game_manager.bombsOn;
	
	if sprite_index = spr_bombs_on {
		sprite_index = spr_bombs_off;
	}
	else {
		sprite_index = spr_bombs_on;
	}
}