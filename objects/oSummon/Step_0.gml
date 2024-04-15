/// @desc 

if (state == STATE.SPAWNING) {
	spawn_progress += 3
	if (spawn_progress > 100) {
		spawn_progress = 100
		state = STATE.IDLE
	}
	
	iframes = 1
	
	exit
}

event_inherited();

iframes--