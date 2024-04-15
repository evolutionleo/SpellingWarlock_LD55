//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 flash_col;
uniform float flash_alpha;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (texture2D( gm_BaseTexture, v_vTexcoord ).a > 0.0) {
		gl_FragColor += flash_col * flash_alpha;
	}
	
}
