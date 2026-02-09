if room == room_game_menu {
	if keyboard_check_pressed(ord("1")) {
		change_player_hat(1, 1);
	}
	if keyboard_check_pressed(ord("2")) {
		change_player_hat(2, 1);
	}
	if keyboard_check_pressed(ord("3")) {
		change_player_hat(3, 1);
	}
	if keyboard_check_pressed(ord("4")) {
		change_player_hat(4, 1);
	}
}

if room == room_spike_stomp {
	for (i = 0; i < array_length(im.players); i++) {
		if healths[i] <= 0 && im.players[i].y > 400 {
			im.players[i].x = 1088;
			im.players[i].y = 256;
		}
	}
}