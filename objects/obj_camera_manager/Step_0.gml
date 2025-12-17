if obj_game_manager.gameStarted || obj_flag.celebration != 0 {
	default_camera();
}
else {
	camera_set_view_pos(camera, 0, 0);
	camera_set_view_size(camera, camWidth, camHeight);
}