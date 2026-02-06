if room == room_jetpack_shootout {
	players = [ obj_jetpack_player ];
}
else if room != room_game_menu {
	players = [ obj_platformer_player1, obj_platformer_player2, obj_platformer_player3, obj_platformer_player4 ];
}