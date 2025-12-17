if velocityY <= TERMINAL_SPEED {
	velocityY = TERMINAL_SPEED;
}
else {
	velocityY -= WEIGHT;
}

x += directionDropping * sweatSpeed;

y -= velocityY;

if y > 1300 {
	instance_destroy();
}