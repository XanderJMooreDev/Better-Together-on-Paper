celebration = 0;
countdownTime = 0;
lastWinner = obj_platformer_player1;
celebrateSpriteLose = "Stand";
celebrateSpriteWin = "Stand";
victorySlot1 = noone;
victorySlot2 = noone;
loserSlot1 = noone;
loserSlot2 = noone;

locate_players = function(collidedPlayerTeam) {
	if (obj_game_manager.player1Team == collidedPlayerTeam) {
		victorySlot1 = obj_platformer_player1;
	}
	else {
		loserSlot1 = obj_platformer_player1;
	}
	
	if (obj_game_manager.player2Team == collidedPlayerTeam) {
		if (victorySlot1 == noone) {
			victorySlot1 = obj_platformer_player2;
		}
		else {
			victorySlot2 = obj_platformer_player2;
		}
	}
	else {
		if (loserSlot1 == noone) {
			loserSlot1 = obj_platformer_player2;
		}
		else {
			loserSlot2 = obj_platformer_player2;
		}
	}
	
	if (obj_game_manager.player3Team == collidedPlayerTeam) {
		if (victorySlot1 == noone) {
			victorySlot1 = obj_platformer_player3;
		}
		else {
			victorySlot2 = obj_platformer_player3;
		}
	}
	else {
		if (loserSlot1 == noone) {
			loserSlot1 = obj_platformer_player3;
		}
		else {
			loserSlot2 = obj_platformer_player3;
		}
	}
	
	if (obj_game_manager.player4Team == collidedPlayerTeam) {
		if (victorySlot1 == noone) {
			victorySlot1 = obj_platformer_player4;
		}
		else {
			victorySlot2 = obj_platformer_player4;
		}
	}
	else {
		if (loserSlot1 == noone) {
			loserSlot1 = obj_platformer_player4;
		}
		else {
			loserSlot2 = obj_platformer_player4;
		}
	}
	
	alarm[0] = 1;
	
	if room == room_spike_stomp {
		x = 1088;
		y = 320;
	}
	
	if celebration == 1 {
		loserSlot1.x = x;
		loserSlot1.y = y;
		victorySlot1.x = x;
		victorySlot1.y = y - 64;
		loserSlot2.x = x + 32;
		loserSlot2.y = y;
		victorySlot2.x = x + 32;
		victorySlot2.y = y - 64;
	}
	
	if room == room_spike_stomp {
		x += 2000;
	}
}