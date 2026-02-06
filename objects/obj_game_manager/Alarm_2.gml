for (i = 0; i < array_length(im.players); i++) {
	if teamNums[i] == 1 {
		players[i].x = 64 + (64 * i);
	}
	else {
		players[i].x = 2176 + (64 * i);
	}
	
	players[i].y = 1024;
}