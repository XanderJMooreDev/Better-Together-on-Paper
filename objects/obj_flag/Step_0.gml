if celebration == 1 {
	show_debug_message(countdownTime);
	countdownTime -= 1 / game_get_speed(gamespeed_fps);
	if countdownTime > 0 {
		celebrateSpriteLose = "Stand";
		if floor(countdownTime * 2) % 2 == 0 {
			celebrateSpriteWin = "Crouch";
		}
		else {
			celebrateSpriteWin = "Stand";
		}
	}
	else {
		room_goto(room_game_menu);
	}
}

show_debug_message(celebration);