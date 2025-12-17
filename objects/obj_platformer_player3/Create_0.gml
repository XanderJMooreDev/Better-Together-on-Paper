WEIGHT = .5;
JUMP_STRENGTH = 10;
RUN_SPEED = 4;
TERMINAL_SPEED = -20;
RESPAWN_X = 0;
RESPAWN_Y = 1024;
joystick = 0;
velocityX = 0;
velocityY = 0;
coyoteTime = 0;
blinkTime = 0;
bombTime = 0;
walkFrame = 0;
animationSpeed = 10;
crouching = false;

standSprite = spr_p3_stand;
preJumpSprite = spr_p3_pre_jump;
jumpSprite = spr_p3_jump;
crouchSprite = spr_p3_crouch;

upCommand = ord("I");
leftCommand = ord("J");
rightCommand = ord("L");
downCommand = ord("K");
bombCommand = ord("O");


terrain_tiles = layer_tilemap_get_id("Collision");
hat = instance_create_layer(x, y, "Hats", obj_teamhat);
hat.player = obj_platformer_player3;
if obj_game_manager.player3Team == 1 {
	hat.color = obj_game_manager.teamColor1;
}
else {
	hat.color = obj_game_manager.teamColor2;
}

hat.sprite = ds_list_find_value(obj_game_manager.playerHats, obj_game_manager.playerHatIDs[3]);

check_collisions = function(changeX, changeY) {
	if place_meeting(x + changeX, y + changeY, obj_team_platform) {
		if x < 1000 {
			obj_game_manager.player3Team = 1;
			hat.image_blend = obj_game_manager.teamColor1;
		}
		else {
			obj_game_manager.player3Team = 2;
			hat.image_blend = obj_game_manager.teamColor2;
		}
	}
	
	if place_meeting(x, y + changeY, obj_team_color_change_box) && changeY != -12 {
		if x < 1000 {
			obj_game_manager.change_team_color_1();
		}
		else {
			obj_game_manager.change_team_color_2();
		}
	}
	
	collidedBomb = instance_place(x, y + changeY, obj_bomb);
	
	if collidedBomb != noone {
		if collidedBomb.image_blend != hat.color && collidedBomb.sprite_index == spr_collision {
			instance_destroy(collidedBomb);
			death_respawn();
			layer_set_visible("Screenshake", false);
		}
	}
	
	return !place_meeting(x + changeX, y + changeY, terrain_tiles) 
	&& !place_meeting(x + changeX, y + changeY, obj_platformer_player1) 
	&& !place_meeting(x + changeX, y + changeY, obj_platformer_player2) 
	&& !place_meeting(x + changeX, y + changeY, obj_platformer_player4)
	&& !place_meeting(x + changeX, y + changeY, obj_team_color_change_box)
	&& !place_meeting(x + changeX, y + changeY, obj_team_platform);
}

throw_bomb = function() {
	bomb = instance_create_layer(x + 16, y, "Instances", obj_bomb);
	bomb.friendly = obj_game_manager.player3Team;
	
	if obj_game_manager.player3Team == 1 {
		bomb.color = obj_game_manager.teamColor1;
	}
	else {
		bomb.color = obj_game_manager.teamColor2;
	}
	
	if joystick == 0 {
		bomb.velocityY = 7;
	}
	else {
		bomb.velocityX = joystick * 5;
		bomb.velocityY = 2;
	}
}

death_respawn = function() {
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