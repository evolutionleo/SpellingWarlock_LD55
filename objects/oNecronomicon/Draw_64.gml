/// @desc 


draw_sprite_ext(sNecronomicon, 0, 5, GUI_H/2, 2, 2, 0, c_white, 1)

//draw_set_font(fNecronomicon)

var _x = 60
var _y = GUI_H/2 - (sprite_get_height(sNecronomicon)/2 * 2) + 85

for(var i  = 0; i < page_spells; i++) {
	var spell = page[i]
	
	// before
	if (i < curr_idx) {
		scribble(spell.text, $"spell{i}").starting_format("fNecronomicon", c_lime).draw(_x, _y)
	}
	// current
	else if (i == curr_idx) {
		scribble(curr_spell_string, $"spell{i}").starting_format("fNecronomicon", c_red)
		.draw(_x, _y)
	}
	// after
	else {
		scribble(spell.text, $"spell{i}").starting_format("fNecronomicon", c_white).draw(_x, _y)
	}
	
	_y += 70
}