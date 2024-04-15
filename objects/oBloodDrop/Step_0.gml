/// @desc 

if (!active) {
	image_alpha -= .05
	if (image_alpha <= 0)
		instance_destroy()
	
	exit
}

x = lerp(x, target_x, 1/20)
y = lerp(y, target_y, 1/20)

//if (point_distance(x, y, target_x, target_y) <= 1) {
	dropped = true
//}



var dist = distance_to_object(oPlayer)

if (dist < 30 and dropped) {
	target_x = x
	target_y = y
	
	var force = min(3, 3 / (dist*dist/100))
	
	var dir = point_direction(x, y, oPlayer.x, oPlayer.y)
	x += lengthdir_x(force, dir)
	y += lengthdir_y(force, dir)
}

if (place_meeting(x, y, oPlayer)) {
	//instance_destroy()
	oGame.addBlood(value)
	
	active = false
}


depth = -y