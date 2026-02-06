if !obj_game_manager.gameStarted {
	return;
}

x += velocityX;
y += velocityY;

if y > 1024 {
	temp = velocityX;
	velocityX = velocityY * (velocityX / abs(velocityX));
	velocityY = -abs(temp);
	x += velocityX;
	y += velocityY;
}
else if y < 192 {
	temp = velocityX;
	velocityX = -velocityY * (velocityX / abs(velocityX));
	velocityY = abs(temp);
	x += velocityX;
	y += velocityY;
}

bounce_off_player(obj_platformer_player1);
bounce_off_player(obj_platformer_player2);
bounce_off_player(obj_platformer_player3);
bounce_off_player(obj_platformer_player4);

if x < 0 {
	obj_game_manager.team2Score++;
	obj_game_manager.gameStarted = false;
	
	obj_flag.lastWinner = 2;
	obj_flag.celebration = 1;
	obj_flag.countdownTime = 6;
	
	obj_flag.locate_players(2);
	instance_destroy();
}
else if x > 2304 {
	obj_game_manager.team1Score++;
	obj_game_manager.gameStarted = false;
	
	obj_flag.lastWinner = 1;
	obj_flag.celebration = 1;
	obj_flag.countdownTime = 6;
	
	obj_flag.locate_players(1);
	instance_destroy();
}