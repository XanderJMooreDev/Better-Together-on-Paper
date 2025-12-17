x = player.x;
y = player.y;

if player.joystick > 0 {
	image_xscale = 1;
}
else if player.joystick < 0 {
	image_xscale = -1;
}

if image_xscale < 0 {
	x += 64;
}

if (player.sprite_index == player.crouchSprite) {
	y += 12;
}
else if (player.sprite_index == player.jumpSprite) {
	y += 2;
}

// Tall hats
if sprite_index == spr_hat_crown {
	y -= 16;
}



if player.blinkTime > 0 {
	player.blinkTime -= 1 / game_get_speed(gamespeed_fps);
	image_alpha = 1 - player.blinkTime % 1;
}
else {
	image_alpha = 1;
}