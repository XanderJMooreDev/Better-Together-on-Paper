if !obj_game_manager.gameStarted {
	return;
}

joystickX = rightCommand - leftCommand;

if abs(joystickX) > 0 {
	velocityX = joystickX * speedX;
}
else if abs(velocityX) > .05 {
	velocityX *= .9;
}
else {
	velocityX = 0;
}

joystickY = downCommand - upCommand;

if abs(joystickY) > 0 {
	velocityY = joystickY * speedY;
}
else if abs(velocityY) > .05 {
	velocityY *= .9;
}
else {
	velocityY = 0;
}

x += velocityX;
y += velocityY;