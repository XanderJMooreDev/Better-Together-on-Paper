temp = 0;

if irandom_range(1,2) == 1 {
	velocityX = 5;
}
else {
	velocityX = -5;
}
velocityY = 0;

bounce_off_player = function(player) {
	if place_meeting(x + velocityX, y + velocityY, player) {
		image_blend = player.hat.image_blend;
		
		if player.x < 1120 {
			velocityX = 7;
			velocityY = player.velocityY;
		}
		else if player.x > 1120 {
			velocityX = -7;
			velocityY = player.velocityY;
		}
	
		x += velocityX;
		y += velocityY;
	}
}