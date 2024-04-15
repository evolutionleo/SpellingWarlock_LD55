/// @desc 

if (state == STATE.DEAD) {
	image_alpha -= .05
	if (image_alpha <= 0)
		instance_destroy()
	
	exit
}

flash_alpha -= flash_alpha_reduce
if flash_alpha < 0
	flash_alpha = 0


getTarget()
pointAndMove()
resolveCollisions()
attackLogic()
stateLogic()
animationLogic()

depth = -y