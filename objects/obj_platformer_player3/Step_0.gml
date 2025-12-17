walkFrame += animationSpeed / game_get_speed(gamespeed_fps);
if walkFrame >= 4 {
	walkFrame = 0;
}

if !obj_game_manager.gameStarted {
	if obj_game_manager.player3Team == obj_flag.lastWinner {
		if obj_flag.celebrateSpriteWin == "Crouch" {
			sprite_index = crouchSprite;
		}
		else if obj_flag.celebrateSpriteWin == "Stand" {
			sprite_index = standSprite;
		}
		else if obj_flag.celebrateSpriteWin == "Jump" {
			sprite_index = jumpSprite;
		}
	}
	else {
		if obj_flag.celebrateSpriteLose == "Crouch" {
			sprite_index = crouchSprite;
		}
		else if obj_flag.celebrateSpriteLose == "Stand" {
			sprite_index = standSprite;
		}
		else if obj_flag.celebrateSpriteLose == "Jump" {
			sprite_index = jumpSprite;
		}	
	}
	return;
}

joystick = 0;

coyoteTime++;

if velocityY <= TERMINAL_SPEED {
	velocityY = TERMINAL_SPEED;
}
else {
	velocityY -= WEIGHT;
}

if keyboard_check(leftCommand) {
	joystick -= 1;
}

if keyboard_check(rightCommand) {
	joystick += 1;
}

if keyboard_check(downCommand) {
	if coyoteTime < 10 {
		joystick = 0;
		crouching = true;
		mask_index = crouchSprite;
	}
	else if coyoteTime > 20 {
		joystick = 0;
		crouching = true;
		velocityY = -15;
		mask_index = crouchSprite;
	}
	else if check_collisions(0, -12) {
		show_debug_message(coyoteTime);
		mask_index = standSprite;
		crouching = false;
	}
}
else {
	if check_collisions(0, -12) {
	mask_index = standSprite;
		crouching = false;
	}
	else if walkFrame == 0 && crouching {
		instance_create_layer(x, y - 16, "Instances", obj_sweat_beads_left);
		instance_create_layer(x, y - 16, "Instances", obj_sweat_beads_right);
	}
}

if crouching {
	joystick = 0;
}

if crouching {
	sprite_index = crouchSprite;
}
else if coyoteTime > 10 {
	sprite_index = jumpSprite;
}
else if coyoteTime > 5 {
	sprite_index = preJumpSprite;
}
else if abs(joystick) > 0 {
	if floor(walkFrame) % 4 == 0 {
		sprite_index = standSprite;
	}
	else if floor(walkFrame) % 4 == 1 ||floor(walkFrame) % 4 == 3 {
		sprite_index = preJumpSprite;
	}
	else {
		sprite_index = jumpSprite;
	}
}
else {
	sprite_index = standSprite;
}

if joystick = 1 {
	velocityX = RUN_SPEED;
}
else if joystick = -1 {
	velocityX = -RUN_SPEED;
}
else if velocityX > .1 {
	velocityX /= 2;
}
else {
	velocityX = 0;
}

if keyboard_check(upCommand) && coyoteTime < 7 {
	velocityY = JUMP_STRENGTH;
}

if check_collisions(velocityX, 0) {
	x += velocityX;
}

if check_collisions(0, -velocityY) {
	y -= velocityY;
	
	if velocityY < -18 {
		if walkFrame % 1 == 0 {
			instance_create_layer(x, y - 16, "Instances", obj_sweat_beads_left);
			instance_create_layer(x, y - 16, "Instances", obj_sweat_beads_right);
		}
		
		if floor(walkFrame) % 2 == 0 {
			sprite_index = jumpSprite;
		}
		else {
			sprite_index = standSprite;
		}
	}
}
else if velocityY < 0 {
	velocityY = 0;
	coyoteTime = 0;
}
else {
	velocityY = 0;
}

if y > 1300 {
	blinkTime = 3;
	if check_collisions(RESPAWN_X - x, RESPAWN_Y - y) {
		x = RESPAWN_X;
		y = RESPAWN_Y;
	}
	else if check_collisions(RESPAWN_X + 64 - x, RESPAWN_Y - y) {
		x = RESPAWN_X + 64;
		y = RESPAWN_Y;
	}
	else if check_collisions(RESPAWN_X + 128 - x, RESPAWN_Y - y) {
		x = RESPAWN_X + 128;
		y = RESPAWN_Y;
	}
	else {
		x = RESPAWN_X + 196;
		y = RESPAWN_Y;
	}
}

if blinkTime > 0 {
	blinkTime -= 1 / game_get_speed(gamespeed_fps);
	image_alpha = 1 - blinkTime % 1;
}
else {
	image_alpha = 1;
}

if bombTime > 0 {
	bombTime -= 1 / game_get_speed(gamespeed_fps);
}
else if keyboard_check(bombCommand) && obj_game_manager.bombsOn {
	bombTime = 5;
	throw_bomb();
}