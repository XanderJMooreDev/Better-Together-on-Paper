team1Score = 0;
team2Score = 0;

p1Health = 10;
p2Health = 10;
p3Health = 10;
p4Health = 10;

player1Team = 1;
player2Team = 2;
player3Team = 1;
player4Team = 2;

bombsOn = false;

team1ChangeCooldown = false;
team2ChangeCooldown = false;

playerHatIDs = array_create(4);

playerHatIDs[0] = 0;
playerHatIDs[1] = 1;
playerHatIDs[2] = 2;
playerHatIDs[3] = 3;
playerHatIDs[4] = 0;

playerHats = ds_list_create();
ds_list_add(playerHats, spr_hat_bandana, 
spr_hat_cap, 
spr_hat_crown, 
spr_hat_shades);

possibleTeamColors = ds_list_create();
ds_list_add(possibleTeamColors, 
make_color_rgb(158, 11, 15), // Red
make_color_rgb(0, 0, 255), // Blue
make_color_rgb(242, 101, 34), // Orange
make_color_rgb(196, 170, 64), // Gold
make_color_rgb(0, 255, 0), // Lime
make_color_rgb(0, 255, 225), // Cyan
make_color_rgb(255, 0, 255), // Magenta
make_color_rgb(255, 71, 144), // Hot Pink
make_color_rgb(178, 105, 33), // Brown
make_color_rgb(183, 183, 183), // Silver
make_color_rgb(0, 0, 0), // Black
);

teamColor1 = make_color_rgb(158, 11, 15);
teamColor2 = make_color_rgb(0, 0, 255);

gameStarted = false;

change_player_hat = function(playerNum, increment) {
	if increment > 0 && playerHatIDs[playerNum] + increment < ds_list_size(playerHats) {
		playerHatIDs[playerNum] += increment;
	}
	else {
		playerHatIDs[playerNum] = 0;
	}
}

change_team_color_1 = function() {
	if team1ChangeCooldown {
		return;
	}
	
	team1ChangeCooldown = true;
	alarm[0] = 10;
	
	if ds_list_find_index(possibleTeamColors, teamColor1) == ds_list_size(possibleTeamColors) - 1 {
		teamColor1 = ds_list_find_value(possibleTeamColors, 0);
	}
	else {
		teamColor1 = ds_list_find_value(possibleTeamColors, ds_list_find_index(possibleTeamColors, teamColor1) + 1);
	}
	
	if (teamColor1 == teamColor2) {
		if ds_list_find_index(possibleTeamColors, teamColor1) == ds_list_size(possibleTeamColors) - 1 {
			teamColor1 = ds_list_find_value(possibleTeamColors, 0);
		}
		else {
			teamColor1 = ds_list_find_value(possibleTeamColors, ds_list_find_index(possibleTeamColors, teamColor1) + 1);
		}
	}
	
	update_hat_colors();
}

change_team_color_2 = function() {
	if team2ChangeCooldown {
		return;
	}
	
	team2ChangeCooldown = true;
	alarm[1] = 10;
	
	if ds_list_find_index(possibleTeamColors, teamColor2) == ds_list_size(possibleTeamColors) - 1 {
		teamColor2 = ds_list_find_value(possibleTeamColors, 0);
	}
	else {
		teamColor2 = ds_list_find_value(possibleTeamColors, ds_list_find_index(possibleTeamColors, teamColor2) + 1);
	}
	
	if (teamColor1 == teamColor2) {
		if ds_list_find_index(possibleTeamColors, teamColor2) == ds_list_size(possibleTeamColors) - 1 {
			teamColor2 = ds_list_find_value(possibleTeamColors, 0);
		}
		else {
			teamColor2 = ds_list_find_value(possibleTeamColors, ds_list_find_index(possibleTeamColors, teamColor2) + 1);
		}
	}
	update_hat_colors();
}

update_hat_colors = function() {
	if player1Team == 1 {
		obj_platformer_player1.hat.image_blend = teamColor1;
	}
	else {
		obj_platformer_player1.hat.image_blend = teamColor2;
	}
	
	if player2Team == 1 {
		obj_platformer_player2.hat.image_blend = teamColor1;
	}
	else {
		obj_platformer_player2.hat.image_blend = teamColor2;
	}
	
	if player3Team == 1 {
		obj_platformer_player3.hat.image_blend = teamColor1;
	}
	else {
		obj_platformer_player3.hat.image_blend = teamColor2;
	}
	
	if player4Team == 1 {
		obj_platformer_player4.hat.image_blend = teamColor1;
	}
	else {
		obj_platformer_player4.hat.image_blend = teamColor2;
	}
}