/// @desc 

enum STATE {
	IDLE,
	RUN,
	ATTACK,
	DEAD,
	
	SPAWNING
}

state = STATE.IDLE


stateLogic = function() {
	var walk = distance_to_point(target_x, target_y) > base_spd
	
	if (state == STATE.IDLE and walk)
		state = STATE.RUN
	else if (state == STATE.RUN and !walk)
		state = STATE.IDLE
}

animationLogic = function() {
	switch(state) {
		case STATE.IDLE:
			sprite_index = idle_sprite
			break
		case STATE.RUN:
			sprite_index = run_sprite
			break
		case STATE.ATTACK:
			sprite_index = attack_sprite
			break
		case STATE.DEAD:
			if (instance_exists(attack_inst) and attack_inst.melee)
				instance_destroy(attack_inst)
			break
	}
}


#region Physics and Movement

dir = 0
spd = {
	x: 0,
	y: 0
}

target_x = x
target_y = y

getTarget = function() {
	target_x = x
	target_y = y
}


resolveCollisions = function() {
	var p = instance_place(x, y, oDude)
	var w = instance_place(x, y, oWall)
	
	do {
		if (w != noone) {
			while (place_meeting(x, y, w)) {
				x += w.dx
				y += w.dy
			}
		}
		
		if (p != noone) {
			var pdir = point_direction(x, y, p.x, p.y)
		
			var k = .1
		
			var dx = lengthdir_x(k, pdir)
			var dy = lengthdir_y(k, pdir)
		
			while (place_meeting(x, y, p)) {
				p.x += dx
				p.y += dy
				x -= dx
				y -= dy
			}
		}
		p = instance_place(x, y, oDude)
		w = instance_place(x, y, oWall)
	}
	until (p == noone and w == noone)
}

pointAndMove = function() {
	dir = point_direction(x, y, target_x, target_y)
	
	side = (dir < 90 || dir > 270) ? 1 : -1
	
	image_xscale = abs(image_xscale) * side
	
	var amount = min(base_spd, point_distance(x, y, target_x, target_y))
	
	spd.x = lengthdir_x(amount, dir)
	spd.y = lengthdir_y(amount, dir)
	
	x += spd.x
	y += spd.y
}

#endregion
#region Attack


curr_attack_cooldown = 0
attack_inst = noone
aggro = false

attack = function() {
	var atk = instance_create_depth(x, y, -y, attack_type)
	atk.owner = self
	atk.target_x = target_x
	atk.target_y = target_y
	atk.dir = point_direction(atk.x, atk.y, target_x, target_y)
	
	atk.damage = damage
	
	attack_inst = atk
}


attackLogic = function() {
	curr_attack_cooldown--
	if curr_attack_cooldown < 0
		curr_attack_cooldown = 0
	
	// if target x is in range
	if (aggro and distance_to_point(target_x, target_y) <= attack_range) {
		if (curr_attack_cooldown == 0) {
			attack()
			curr_attack_cooldown = attack_cooldown
			state = STATE.ATTACK
		}
	}
}


#endregion
#region Health

//max_hp = 100
hp = max_hp
iframes = 0
max_iframes = 0


max_flash_alpha = 1
flash_alpha = 0
flash_alpha_reduce = .08
u_flash = shader_get_uniform(shFlash, "flash_col")
u_alpha = shader_get_uniform(shFlash, "flash_alpha")


die = function() {
	state = STATE.DEAD
}

handleHealth = function() {
	if (hp <= 0) {
		hp = 0
		die()
	}
	
	if (hp > max_hp)
		hp = max_hp
}

hurt = function(amount) {
	if (iframes > 0)
		return 0
	
	iframes = max_iframes
	
	flash_alpha = max_flash_alpha
	
	hp -= amount
	handleHealth()
}

heal = function(amount) {
	hp += amount
	handleHealth()
}

deal = function(target, amount = damage) {
	target.hurt(amount)
}

dropBlood = function() {
	var len = irandom(5)
	var dir = irandom(360)
	
	_x = x + lengthdir_x(len, dir)
	_y = y + lengthdir_y(len, dir)
	
	var b = instance_create_depth(x, y - 5, 0, oBloodDrop)
	
	b.target_x = _x
	b.target_y = _y
}


#endregion
