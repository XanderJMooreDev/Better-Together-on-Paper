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
	if p1Health <= 0 && obj_platformer_player1.y > 400 {
		obj_platformer_player1.x = 1088;
		obj_platformer_player1.y = 256;
	}
	
	
	if p2Health <= 0 && obj_platformer_player2.y > 400 {
		obj_platformer_player2.x = 1088;
		obj_platformer_player2.y = 256;
	}
	
	
	if p3Health <= 0 && obj_platformer_player3.y > 400 {
		obj_platformer_player3.x = 1088;
		obj_platformer_player3.y = 256;
	}
	
	
	if p4Health <= 0 && obj_platformer_player4.y > 400 {
		obj_platformer_player4.x = 1088;
		obj_platformer_player4.y = 256;
	}
}