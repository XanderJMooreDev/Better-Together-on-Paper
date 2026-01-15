_gamepad = async_load[? "pad_index"];

switch (async_load[? "event_type"]) {
	case "gamepad discovered":
		array_push(gamepads, _gamepad);
		gamepad_set_axis_deadzone(_gamepad, .2);
		break;
	
	case "gamepad lost":
		_array_index = array_get_index(gamepads, _gamepad);
		if _array_index >= 0 {
			array_delete(gamepads, _array_index, 1);
		}
		break;
}

