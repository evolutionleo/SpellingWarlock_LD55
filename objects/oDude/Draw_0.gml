/// @desc 

shader_set(shFlash)
shader_set_uniform_f(u_flash, 1, 1, 1, 1)
shader_set_uniform_f(u_alpha, flash_alpha)

draw_self()

shader_reset()

//draw_text(x, bbox_top - 5, $"{hp}/{max_hp}")