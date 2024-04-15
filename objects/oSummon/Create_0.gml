/// @desc 

event_inherited()

max_iframes = 30

state = STATE.SPAWNING
spawn_progress = 0

spot_range = 300
locked_on = noone


getTarget = function() {
	var e = instance_nearest(x, y, oEnemy)
	
	if (instance_exists(e) and distance_to_point(e.x, e.y) < spot_range) {
		locked_on = e
	}
	
	
	if (instance_exists(locked_on)) {
		target_x = locked_on.x
		target_y = locked_on.y
		aggro = true
	}
	else {
		var dir = point_direction(x, y, oPlayer.x, oPlayer.y)
		target_x = oPlayer.x - lengthdir_x(32, dir)
		target_y = oPlayer.y - lengthdir_y(32, dir)
		
		aggro = false
	}
}