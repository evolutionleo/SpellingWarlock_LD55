/// @desc 

for(var c = ord("A"); c <= ord("Z"); c++) {
	if (keyboard_check_pressed(c)) {
		curr_typed += chr(c)
		show_debug_message(curr_typed)
	}
	
	if (curr_typed == str) {
		room_goto_next()
	}
	else if (string_starts_with(str, curr_typed)) {
		var idx = string_length(curr_typed) + 1
		s = "[c_red]" + string_insert("[c_white]", str, idx)
	}
	else { // reset on error
		curr_typed = ""
	}
}