image_blend = color;

if velocityY <= -10 {
	velocityY = -10;
}
else {
	velocityY -= .2;
}

if !place_meeting(x, y - velocityY, terrain_tiles) {
	y -= velocityY;
}
else {
	velocityY = 0;

	if velocityX > .1 {
		velocityX /= 2;
	}
	else {
		velocityX = 0;
	}
}

if !place_meeting(x + velocityX, y, terrain_tiles) {
	x += velocityX;
}
else {
	velocityX = 0;
}