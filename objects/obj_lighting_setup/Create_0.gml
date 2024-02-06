/// @description Insert description here
// You can write your code in this editor

//cleanup = call_later(2, time_source_units_seconds, lighting_buildup_remover, true);
// oooooo shaders!
base_ambient_light = ambient_light;

_last_x_corner = 0;
_last_y_corner = 0;

surface_resize(application_surface, 640, 360);
display_set_gui_maximize();

application_surface_draw_enable(false);

u_pos = shader_get_uniform(sh_light, "u_pos");
u_zz = shader_get_uniform(sh_light, "zz");
u_strength = shader_get_uniform(sh_light, "u_strength");

u_dir = shader_get_uniform(sh_light, "u_dir");
u_fov = shader_get_uniform(sh_light, "u_fov");


u_pos2 = shader_get_uniform(sh_shadow, "u_pos");

vertex_format_begin();
vertex_format_add_position_3d();
vf = vertex_format_end();

vb = vertex_create_buffer();

shad_surf = noone;

function bg_begin()
{
	gpu_set_colorwriteenable(1,1,1,0);	
}

function bg_end()
{
	gpu_set_colorwriteenable(1,1,1,1);	
}

var _bg_layer = layer_get_id("void");
layer_script_begin(_bg_layer, bg_begin);
layer_script_end(_bg_layer, bg_end);

