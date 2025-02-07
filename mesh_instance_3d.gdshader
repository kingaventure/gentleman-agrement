shader_type spatial;

uniform sampler2D heightmap;
uniform sampler2D terrain_texture;  // Texture pour le terrain (par exemple, herbe, roche)
uniform float height_scale : hint_range(0.0, 10.0) = 1.0;
uniform vec2 terrain_size = vec2(100.0, 100.0);

void vertex() {
    // Calculer la position UV pour la heightmap
    vec2 uv = UV * terrain_size;
    
    // Récupérer la hauteur de la heightmap à ce point UV
    float height = texture(heightmap, uv).r * height_scale;
    
    // Appliquer la hauteur sur la coordonnée Y
    VERTEX.y += height;
}

void fragment() {
    // Récupérer la couleur de la texture
    vec4 texColor = texture(terrain_texture, UV);
    
    // Calculer la couleur basée sur la hauteur
    float height = VERTEX.y / height_scale; // Normaliser la hauteur
    
    // Créer un dégradé de couleur en fonction de la hauteur (plus haut = plus clair)
    vec4 heightColor = vec4(height, height, height, 1.0);
    
    // Mélanger la couleur de la texture avec le dégradé de hauteur
    ALBEDO = mix(texColor.rgb, heightColor.rgb, 0.5);  // Ajuste 0.5 pour plus ou moins d'effet
}

