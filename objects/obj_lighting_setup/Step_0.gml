/// @description Insert description here
// You can write your code in this editor

// fucking math

function quad(_vb, _x1, _y1, _x2, _y2)
{
	vertex_position_3d(_vb, _x1, _y1, 0);
	vertex_position_3d(_vb, _x1, _y1, 2);
	vertex_position_3d(_vb, _x2, _y2, 1);
	
	vertex_position_3d(_vb, _x1, _y1, 2);
	vertex_position_3d(_vb, _x2, _y2, 1);
	vertex_position_3d(_vb, _x2, _y2, 3);
}

if(mouse_check_button_pressed(mb_left))
{
	instance_create_depth(mouse_x, mouse_y, depth, obj_light);		
}

vertex_begin(vb, vf);
var _vb = vb;
with(obj_solid_tile)
{
	//var _dist = distance_to_object(global.players[| 0]);
	//if (_dist < SHADOW_CAST_RANGE)
	{
		quad(_vb, x, y, x + sprite_width, y + sprite_height);
		quad(_vb, x + sprite_width, y, x, y + sprite_height);
	}
	//show_debug_message("quad");
}
with (obj_solid_tile_triangle)
{
	//var _dist = distance_to_object(global.players[| 0]);
	//if (_dist < SHADOW_CAST_RANGE)
	{
		quad(_vb, x, y, x + sprite_width, y + sprite_height);
		quad(_vb, x, y + sprite_height, mid_x, mid_y);
	}
}
vertex_end(vb);

