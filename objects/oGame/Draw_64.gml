/// @desc 

//draw_set_halign(fa_right)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
//draw_set_color(c_white)
draw_set_color(c_red)
draw_set_font(fBloodCount)


var s = $"blood: {blood} " + (added_blood > 0 ? $"(+{ceil(added_blood)})" : "")
s += $"\nhp: {oPlayer.hp}/{oPlayer.max_hp}"

draw_text(GUI_W - 20 - string_width("blood: 1000 (+100)"), 20, s)

//draw_healthbar(30, GUI_H - 40, GUI_W-30, GUI_H - 5, (blood / max_blood) * 100, c_black, c_red, c_red, 0, false, false)