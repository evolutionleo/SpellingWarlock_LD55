/// @desc 

if (state == STATE.DEAD) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(fGameover)
	draw_set_color(c_red)
	
	draw_text(GUI_W/2, GUI_H/2, "Game Over. Press R to restart")
}

//draw_text(0, 0, hp)