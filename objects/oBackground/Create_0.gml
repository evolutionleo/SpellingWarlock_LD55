/// @desc 

dots = []

max_dots = (room_width / 64) * (room_height / 64) * 15

for(var i = 0; i < max_dots; i++) {
	array_push(dots, { x: irandom(room_width), y: irandom(room_height) })
}
