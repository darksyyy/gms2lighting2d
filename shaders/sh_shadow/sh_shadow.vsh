//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)

uniform vec2 u_pos;

const float len = 100000.;

varying float t_dis;
varying float l_dis;

void main()
{	
	
	vec2 pos = in_Position.xy;
	vec2 dis = pos - u_pos;
	float s_dis = length(dis);
	if (in_Position.z > 1.)
	{
		pos += dis/s_dis * len;
		t_dis = in_Position.z-2.;
		l_dis = 1.;
	} else {
		l_dis = s_dis/len;
		t_dis = mix(0.5, in_Position.z, l_dis);
	}
    vec4 object_space_pos = vec4(pos.x, pos.y, 0., 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
}
