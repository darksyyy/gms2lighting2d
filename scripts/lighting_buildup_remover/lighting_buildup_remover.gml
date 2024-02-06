// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lighting_buildup_remover()
{
	with (obj_light)
	{
		var _nearby_lights = ds_list_create();
		var _nearby = collision_circle_list(x, y, size, obj_light, false, true, _nearby_lights, true);
		var _num_lights = ds_list_size(_nearby_lights);
		
		for (var _i = 0; _i < _num_lights; _i++)
		{
			if (!_nearby_lights[| _i]) continue;
			if (!_nearby_lights[| _i].enabled)
			{
				ds_list_delete(_nearby_lights, _i);
				_i--;
				//show_debug_message("delete disabled light");
			}
		}
		
		
		if (_num_lights >= 3)
		{
			for (var _i = 0; _i < _num_lights; _i++)
			{
				if (!_nearby_lights[| _i]) continue;
				_nearby_lights[| _i].enabled = false;	
			}
			//show_debug_message("too many lights");
		} else {
			enabled = true;	
		}
		
		ds_list_destroy(_nearby_lights);
	}
}