countdownTime -= 1 / game_get_speed(gamespeed_fps);

if countdownTime <= 0 {
	if sprite_index == spr_count_3 {
		sprite_index = spr_count_2;
	}
	else if sprite_index == spr_count_2 {
		sprite_index = spr_count_1;
	}
	else if sprite_index == spr_count_1 {
		sprite_index = spr_count_go;
		obj_game_manager.gameStarted = true;
	}
	
	countdownTime = 1;
}

if sprite_index == spr_count_go {
	image_alpha -= .01;
}

if image_alpha <= 0 {
	instance_destroy();
}