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

gm = obj_game_manager;

playerID = 0;

standSprite = spr_p1_stand;
preJumpSprite = spr_p1_pre_jump;
jumpSprite = spr_p1_jump;
crouchSprite = spr_p1_crouch;

// Default values, rewritten in obj_controller_manager
upCommand = ord("W");
leftCommand = ord("A");
rightCommand = ord("D");
downCommand = ord("S");
bombCommand = ord("E");

terrain_tiles = layer_tilemap_get_id("Collision");
hat = instance_create_layer(x, y, "Hats", obj_teamhat);
hat.player = self;

if gm.teamNums[playerID] == 1 {
	hat.color = gm.teamColor1;
}
else {
	hat.color = gm.teamColor2;
}

hat.sprite = ds_list_find_value(gm.playerHats, gm.playerHatIDs[1]);

check_collisions = function(changeX, changeY) {
	if place_meeting(x + changeX, y + changeY, obj_team_platform) {
		if x < 1000 {
			gm.teamNums[playerID] = 1;
			hat.image_blend = gm.teamColor1;
		}
		else {
			gm.teamNums[playerID] = 2;
			hat.image_blend = gm.teamColor2;
		}
	}
	
	if place_meeting(x, y + changeY, obj_team_color_change_box) && changeY != -12 {
		if x < 1000 {
			gm.change_team_color_1();
		}
		else {
			gm.change_team_color_2();
		}
	}
	
	if room == room_spike_stomp {
		im = obj_instance_manager;
		for (i = 0; i < array_length(im.players); i++) {
			if place_meeting(x, y - 20, im.players[i] && im.players[i].velocityY < -5) {
				gm.healths[playerID] -= 1;
				
				if im.players[i].velocityY < -12 {
					gm.healths[playerID] -= 2;
				}
				
				im.players[i].velocityY = 0;
			}
		}
	}
	
	collidedBomb = instance_place(x, y + changeY, obj_bomb);
	
	if collidedBomb != noone {
		if collidedBomb.image_blend != hat.color && collidedBomb.sprite_index == spr_collision {
			instance_destroy(collidedBomb);
			
			if room == room_platformer1 {
				death_respawn();
			}
			else {
				gm.healths[playerID] -= 3;
			}
			
			layer_set_visible("Screenshake", false);
		}
	}
	
	return !place_meeting(x + changeX, y + changeY, terrain_tiles) 
	&& !place_meeting(x + changeX, y + changeY, obj_platformer_player1)
	&& !place_meeting(x + changeX, y + changeY, obj_team_color_change_box)
	&& !place_meeting(x + changeX, y + changeY, obj_team_platform);
}

throw_bomb = function() {
	bomb = instance_create_layer(x + 16, y, "Instances", obj_bomb);
	bomb.friendly = gm.teamNums[playerID];
	
	if gm.teamNums[playerID] == 1 {
		bomb.color = gm.teamColor1;
	}
	else {
		bomb.color = gm.teamColor2;
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