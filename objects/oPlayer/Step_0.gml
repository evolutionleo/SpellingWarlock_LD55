/// @desc 

flash_alpha -= flash_alpha_reduce
if flash_alpha < 0
	flash_alpha = 0


iframes--


if (state == STATE.DEAD) {
	sprite_index = sPlayerIdle
	//dead_counter--
	
	//if (dead_counter <= 0)
	//	room_restart()
	
	depth = -y
	
	if (keyboard_check_pressed(ord("R")))
		room_restart()
	
	exit
}

target_x = mouse_x
target_y = mouse_y


if (mouse_check_button(mb_left)) {
	pointAndMove()
	resolveCollisions()
	
	if (distance_to_point(target_x, target_y) > base_spd)
		state = STATE.RUN
	else
		state = STATE.IDLE
}
else {
	state = STATE.IDLE
}

animationLogic()

depth = -y