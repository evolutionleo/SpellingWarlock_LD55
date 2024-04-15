/// @desc 

var sw = sprite_get_width(sprite_index)
var sh = sprite_get_height(sprite_index)

var ox = sprite_get_xoffset(sprite_index)
var oy = sprite_get_yoffset(sprite_index)


var h = sh * (spawn_progress / 100)

if (state == STATE.SPAWNING) {
	draw_sprite_part(sprite_index, image_index, 0, 0, sw, h, x - ox, y - oy + sh - h)
}
else draw_self()