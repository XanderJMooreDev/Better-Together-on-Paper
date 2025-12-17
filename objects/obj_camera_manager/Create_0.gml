camera = view_camera[0];

camera_border_x = 500;
camera_border_y = 50;

minX = 3000;
maxX = 0;
minY = 3000;
maxY = 0;

camera_width = 2304; 
camera_height = 1280;

camX = 0;
camY = 0;
camWidth = 2304;
camHeight = 1280;

check_corners = function(player) {
	if player.x < minX {
		minX = player.x;
	}
	
	if player.x + 64 > maxX {
		maxX = player.x + 64;
	}
	
	if player.y < minY {
		minY = player.y;
	}
	
	if player.y + 128 > maxY {
		maxY = player.y + 128;
	}
}

default_camera = function() {
	minX = obj_platformer_player1.x;
	maxX = obj_platformer_player1.x;
	minY = obj_platformer_player1.y;
	maxY = obj_platformer_player1.y;

	check_corners(obj_platformer_player1);
	check_corners(obj_platformer_player2);
	check_corners(obj_platformer_player3);
	check_corners(obj_platformer_player4);

	if minX < camera_border_x {
		minX = camera_border_x;
	}

	if minY < camera_border_y {
		minY = camera_border_y;
	}

	if maxX - minX > 2304 {
		maxX = minX + 2304;
	}

	if maxX - minX + camera_border_x + 300 > (maxY - minY + camera_border_y + 300) / 1280 * 2304 {
		camera_width = maxX - minX + camera_border_x + 300;
		camera_height = (maxX - minX + camera_border_x + 300) / 2304 * 1280;
	}
	else {
		camera_width = (maxY - minY + camera_border_y + 300) / 1280 * 2304;
		camera_height = maxY - minY + camera_border_y + 300;
	}

	if camera_height < 813 || camera_width < 1463.4 {
		camera_height = 813;
		camera_width = 1463.4;
	}

	if minY - camera_border_y + camera_height >= 1280 {
		minY += 1280 - (minY - camera_border_y + camera_height);
	}

	camX = lerp(camX, minX - camera_border_x, .1);
	camY = lerp(camY, minY - camera_border_y, .1);
	camWidth = lerp(camWidth, camera_width, .1);
	camHeight = lerp(camHeight, camera_height, .1);

	camera_set_view_pos(camera, camX, camY);
	camera_set_view_size(camera, camWidth, camHeight);
}