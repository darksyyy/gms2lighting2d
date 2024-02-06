
varying float t_dis;
varying float l_dis;

void main()
{
	float str = (1.- abs(t_dis-0.5)*2./l_dis)*5.;
    gl_FragColor = vec4(str);
}
