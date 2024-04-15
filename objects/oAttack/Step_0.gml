/// @desc 

var hitlist = ds_list_create()

var count = instance_place_list(x, y, oDude, hitlist, false)
var didHit = false

for (var i = 0; i < count; ++i) {
	var inst = hitlist[| i]
	if (shouldHit(inst)) {
		inst.hurt(damage)
		didHit = true
		
		ds_list_add(hitByAttack, inst)
	}
}

ds_list_destroy(hitlist)

if (didHit) {
	if (destroy_on_hit)
		instance_destroy()
}