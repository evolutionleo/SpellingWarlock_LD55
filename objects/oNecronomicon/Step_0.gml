/// @desc 

if (oPlayer.state == STATE.DEAD) {
	curr_typed = ""
	exit
}



if (keyboard_check_pressed(vk_space))
	curr_typed += " "

for(var c = ord("A"); c <= ord("Z"); c++) {
	if (keyboard_check_pressed(c)) {
		curr_typed += chr(c)
		show_debug_message(curr_typed)
	}
	
	if (curr_typed == curr_spell_text) {
		castSpell()
		nextSpell()
	}
	else if (string_starts_with(curr_spell_text, curr_typed)) {
		var idx = string_length(curr_typed) + 1
		curr_spell_string = "[c_red]" + string_insert("[c_white]", curr_spell_text, idx)
	}
	else { // reset on error
		curr_typed = ""
	}
}


//if (keyboard_check_pressed(ord("C"))) {
//	instance_create_depth(mouse_x, mouse_y, -mouse_y, oGolem)
//}