extends CharacterBody3D  # Utilisation de CharacterBody3D en Godot 4

# Variables pour la vitesse et la direction du personnage
var movement_speed : float = 5.0  # Vitesse du mouvement
var rotation_speed : float = 5.0

# Fonction appelée à chaque frame pour gérer le mouvement
func _process(delta: float) -> void:
	var direction : Vector3 = Vector3.ZERO

	# Détection des touches pour le mouvement
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_backward"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1

	# Appliquer la direction et normaliser le mouvement
	direction = direction.normalized() * movement_speed

	# Appliquer la rotation du personnage
	if direction.length() > 0:
		var target_rotation = deg_to_rad(atan2(direction.x, direction.z))  # Rotation en Y
		rotation.y = lerp_angle(rotation.y, target_rotation, rotation_speed * delta)

	# Assigner la vélocité et déplacer le personnage
	velocity = direction  # Assignation de la vélocité à la propriété native 'velocity'
	move_and_slide()  # Utilisation correcte de 'move_and_slide' sans arguments
