shader_type spatial;

uniform sampler2D heightmap;
uniform sampler2D terrain_texture;
uniform float height_scale : hint_range(0.0, 10.0) = 5.0;

void vertex() {
    float height = texture(heightmap, UV).r * height_scale;
    VERTEX.y += height;
}

void fragment() {
    vec4 texColor = texture(terrain_texture, UV * 10.0); // Augmente l'échelle de la texture
    ALBEDO = texColor.rgb;
}