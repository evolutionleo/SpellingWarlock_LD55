/// @desc 

// Inherit the parent event
event_inherited();

base_spd = 1

getTarget = function() {
	e = instance_nearest(x, y, oSummon)
	
	if (instance_exists(e) and distance_to_point(e.x, e.y) < distance_to_object(oPlayer)) {
		target_x = e.x
		target_y = e.y
	}
	else {
		target_x = oPlayer.x
		target_y = oPlayer.y
	}
	
	aggro = true
}

die = function() {
	if (state != STATE.DEAD) {
		state = STATE.DEAD
	
		repeat(blood_drop) {
			dropBlood()
		}
	}
}