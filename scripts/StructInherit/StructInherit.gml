// <3
function struct_inherit(dest, source) {
	var names = struct_get_names(source)
	var nc = struct_names_count(source)
	for(var i = 0; i < nc; i++) {
		var name = names[i]
		var value = struct_get(source, name)
		
		if (is_struct(value)) {
			value = struct_inherit({}, value)
		}
		
		struct_set(dest, name, value)
	}
	
	return dest
}