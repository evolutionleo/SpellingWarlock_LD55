/// @desc 

if (state == STATE.ATTACK) {
	state = STATE.IDLE
	if (instance_exists(attack_inst) and attack_inst.melee)
		instance_destroy(attack_inst)
}