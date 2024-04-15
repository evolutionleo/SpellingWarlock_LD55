/// @desc 

for(var i = 0; i < array_length(dots); i++) {
	draw_set_color(c_white)
	if (oPlayer.state == STATE.DEAD)
		draw_set_color(c_red)
	
	draw_point(dots[i].x, dots[i].y)
}