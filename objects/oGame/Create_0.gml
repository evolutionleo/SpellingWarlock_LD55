/// @desc 

//display_set_gui_maximize(.5, .5)
//display_set_gui_size(768*2, 432*2)


blood = 0
//max_blood = 100

added_blood = 0

added_timer = 0
max_added_timer = 160

addBlood = function(amount) {
	// heal 10 hp per 100 blood
	if (blood + amount) div 100 > blood div 100 {
		oPlayer.heal(8)
	}
	
	blood += amount
	added_blood += amount
	added_timer = max_added_timer
}


alarm[0] = 10


spawnVillager = function() {
	var cx = camera_get_view_x(oCamera.cam)
	var cy = camera_get_view_y(oCamera.cam)
	
	var cw = camera_get_view_width(oCamera.cam)
	var ch = camera_get_view_height(oCamera.cam)
	
	var _x, _y
	//do {
	//	_x = irandom(room_width)
	//	_y = irandom(room_height)
	//} until (!point_in_rectangle(_x, _y, cx, cy, cx + cw, cy + ch))
	
	
	// spawn on 1 of 4 directions from the screen / camera
	
	var sdir = choose("right", "left", "up", "down")
	var offset = 50
	
	if (sdir == "right" or sdir == "left") {
		_y = irandom_range(cy, cy+ch)
	}
	else {
		_y = sdir == "up" ? (cy - offset) : (cy + ch + offset)
	}
	
	if (sdir == "up" or sdir == "down") {
		_x = irandom_range(cx, cx + cw)
	}
	else {
		_x = sdir == "left" ? (cx - offset) : (cx + cw + offset)
	}
	
	
	var inst = instance_create_depth(_x, _y, 0, oVillager)
}
