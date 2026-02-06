if room == room_platformer1 {
	gameStarted = false;
}

if room == room_spike_stomp {
	gameStarted = false;
	healths = [ 10, 10, 10, 10 ];
	p1Health = 10;
	p2Health = 10;
	p3Health = 10;
	p4Health = 10;
}

if room == room_reassign_teams {
	gameStarted = true;
	healths = [ 10, 10, 10, 10 ];
	p1Health = 10;
	p2Health = 10;
	p3Health = 10;
	p4Health = 10;
}

if room == room_ping_pong {
	gameStarted = false;
	
	alarm[2] = 1;
}