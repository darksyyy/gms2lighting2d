varying vec2 pos;
varying vec4 col;
varying vec2 v_vTexcoord;

uniform vec2 u_pos;

uniform float zz;
uniform float u_strength;

uniform float u_dir;
uniform float u_fov;


#define PI 3.1415926538

void main()
{
	vec2 dis = pos - u_pos;
	float str = 1./(sqrt(dis.x*dis.x + dis.y*dis.y + zz * zz) - zz+1.-u_strength);
	
	float dir = radians(u_dir);
	float h_fov = radians(u_fov) * 0.5;
	
	if (h_fov < PI)
	{
		float rad = atan(-dis.y, dis.x);	
		float a_dis = abs(mod (rad+2.*PI,2.*PI) - dir);
		a_dis = min(a_dis, 2.* PI - a_dis);
		
		str *= clamp((1.-a_dis/h_fov)*2., 0., 1.);
	}
	
	vec4 frag = texture2D( gm_BaseTexture, v_vTexcoord);
    gl_FragColor = col*vec4(vec3(str), 1.) * frag;
}
