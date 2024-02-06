/// @description Insert description here
// You can write your code in this editor
var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _vb = vb;
var _x_corner = 0;
var _y_corner = 0;
var _u_zz = u_zz;
var _u_strength = u_strength;
var _u_dir = u_dir;
var _u_fov = u_fov; 


if (!surface_exists(shad_surf))
{
	shad_surf = surface_create(640, 360);
}

matrix_set(matrix_world, matrix_build(-_x_corner,-_y_corner,0,0,0,0,1,1,1));
surface_set_target(shad_surf);
draw_clear_alpha(c_black, 0);
draw_surface_ext(application_surface,  _x_corner, _y_corner, 1, 1, 0, c_white, ambient_light);

with(obj_light)
{	
	if (enabled)
	{
		gpu_set_blendmode_ext_sepalpha(bm_zero, bm_one, bm_one, bm_one);
		shader_set(sh_shadow);
		shader_set_uniform_f(_u_pos2, x, y);
		//show_debug_message("start shadow");
		vertex_submit(_vb, pr_trianglelist, -1);
	
		gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha, bm_one, bm_zero, bm_zero);
		shader_set(sh_light);
		shader_set_uniform_f(_u_pos, x, y);
		shader_set_uniform_f(_u_zz, size);
		shader_set_uniform_f(_u_strength, strength);
		shader_set_uniform_f(_u_dir, dir);
		shader_set_uniform_f(_u_fov, fov);
		// Draw the lighting surface at camera position
		draw_surface_ext(application_surface,  _x_corner, _y_corner, 1, 1, 0, color, 1);
		//draw_rectangle(0,0, 320, 180, 0);
		gpu_set_blendmode(bm_normal);
	}
}

shader_reset();
surface_reset_target();
matrix_set(matrix_world, matrix_build(0,0,0,0,0,0,1,1,1));

gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
draw_surface(shad_surf, _x_corner, _y_corner);


shader_reset();
gpu_set_blendmode(bm_normal);