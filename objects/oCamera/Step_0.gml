/// @desc 

tcx = (oPlayer.x + mouse_x) / 2
tcy = (oPlayer.y + mouse_y) / 2


cx = lerp(cx, tcx, 1/20)
cy = lerp(cy, tcy, 1/20)


camera_set_view_pos(cam, (cx - cw/2), (cy - ch/2))