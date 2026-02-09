if room == room_jetpack_shootout {
	players = [ obj_jetpack_player ];
}
else if room != room_game_menu {
	//players = [ obj_platformer_player1, obj_platformer_player2, obj_platformer_player3, obj_platformer_player4 ];
}

if room == room_platformer1 || room == room_reassign_teams || room == room_spike_stomp {
	if room == room_platformer1 {
		players = [ 
			instance_create_layer(0, 1024, "Instances", obj_platformer_player1),
			instance_create_layer(64, 1024, "Instances", obj_platformer_player1),
			instance_create_layer(128, 1024, "Instances", obj_platformer_player1),
			instance_create_layer(192, 1024, "Instances", obj_platformer_player1)
		];
	}
	else if room == room_reassign_teams {
		players = [ 
			instance_create_layer(992, 1024, "Instances", obj_platformer_player1),
			instance_create_layer(1056, 1024, "Instances", obj_platformer_player1),
			instance_create_layer(1120, 1024, "Instances", obj_platformer_player1),
			instance_create_layer(1184, 1024, "Instances", obj_platformer_player1)
		];
	}
	else if room == room_spike_stomp {
		players = [ 
			instance_create_layer(320, 1024, "Instances", obj_platformer_player1),
			instance_create_layer(512, 896, "Instances", obj_platformer_player1),
			instance_create_layer(1728, 896, "Instances", obj_platformer_player1),
			instance_create_layer(1920, 1024, "Instances", obj_platformer_player1)
		];
	}
	
	for (i = 0; i < array_length(players); i++) {
		players[i].playerID = i;
		
		if gm.teamNums[i] == 1 {
			players[i].hat.color = gm.teamColor1;
		}
		else {
			players[i].hat.color = gm.teamColor2;
		}
		
		players[i].hat.sprite = ds_list_find_value(obj_game_manager.playerHats, obj_game_manager.playerHatIDs[i + 1]);
		
		players[i].standSprite = standSprites[i];
		players[i].preJumpSprite = preJumpSprites[i];
		players[i].jumpSprite = jumpSprites[i];
		players[i].crouchSprite = crouchSprites[i];
	}
}