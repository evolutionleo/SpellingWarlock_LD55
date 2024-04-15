/// @desc 



//curr = scribble("")

page = [
	
]
page_spells = 0

curr_idx = 0
curr_spell = undefined
curr_spell_text = ""
curr_typed = ""

curr_spell_string = ""

spells = global.spells


castSpell = function() {
	var s = curr_spell.summon
	var obj = s.type
	var c = s.count
	
	repeat(c) {
		var sum = instance_create_depth(mouse_x, mouse_y, 0, obj)
	}
}

nextSpell = function() {
	if (curr_idx+1 >= page_spells) {
		curr_idx = -1
		nextPage()
	}
	
	curr_spell = page[++curr_idx]
	
	curr_spell_text = curr_spell.text
	
	
	curr_typed = ""
}

nextPage = function() {
	page = []
	
	repeat(3)
		addNewSpell("zombie")

	repeat(2)
		addNewSpell("golem")

	repeat(1)
		addNewSpell("demon")
}


getSpell = function(type) {
	var spell = struct_inherit({}, spells[$ type])
	var arr = spell.text
	spell.text = string_upper(arr[irandom(array_length(arr)-1)])
	
	return spell
}

addNewSpell = function(type) {
	var spell
	do {
		spell = getSpell(type)
	} until(!array_contains(page, spell))
	
	array_push(page, spell)
	page_spells = array_length(page)
}

start = function() {
	nextSpell()
}




start()

