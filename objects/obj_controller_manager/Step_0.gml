if room == room_game_menu {
	return;
}

for (i = 0; i < array_length(im.players); i++) {
	if controller_modes[i] == "Key" {
		im.players[i].upCommand = keyboard_check(up_controls[i]);
		im.players[i].downCommand = keyboard_check(down_controls[i]);
		im.players[i].leftCommand = keyboard_check(left_controls[i]);
		im.players[i].rightCommand = keyboard_check(right_controls[i]);
		im.players[i].bombCommand = keyboard_check(bomb_controls[i]);
	}
	else if controller_modes[i] == "Controller" {
		if array_length(gamepads) > i {
			im.players[i].upCommand = gamepad_button_check(gamepads[i], up_controls[i]);
			im.players[i].downCommand = gamepad_button_check(gamepads[i], down_controls[i]);
			im.players[i].leftCommand = gamepad_button_check(gamepads[i], left_controls[i]);
			im.players[i].rightCommand = gamepad_button_check(gamepads[i], right_controls[i]);
			im.players[i].bombCommand = gamepad_button_check(gamepads[i], bomb_controls[i]);
		}
	}
}

show_debug_message(array_length(gamepads));