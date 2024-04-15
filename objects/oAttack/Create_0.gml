/// @desc

if (melee) {
	visible = false
}

//mask = undefined
owner = undefined
damage = 1

target_x = x
target_y = y

hit_once = true

hitByAttack = ds_list_create()


shouldHit = function(inst) {
	if (ds_list_find_index(hitByAttack, inst) != -1) return false
	if (owner == inst) return false
	
	
	var o1 = owner.object_index
	var o7 = inst.object_index
	
	var is_summon = object_is_ancestor(o1, oSummon)
	var inst_is_friendly = object_is_ancestor(o7, oSummon) || o7 == oPlayer
	
	return (is_summon xor inst_is_friendly)
}


