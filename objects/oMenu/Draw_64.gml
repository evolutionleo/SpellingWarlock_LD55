/// @desc 

draw_set_font(fTitle)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_text(GUI_W/2, GUI_H/2-50, "BLOODY SPELLING WARLOCK")

draw_set_font(fMenu)

scribble("[c_white]spell [c_red]" + s + " to play").starting_format("fMenu", c_white).draw(GUI_W/2, GUI_H/2+10)