extends Button  # Assure-toi que ce script est attaché à un nœud Button

# Fonction appelée lorsque le bouton est pressé
func _ready():
	# Connecte le signal "pressed" à la fonction "_on_BoutonRetour_pressed"
	self.pressed.connect(_on_BoutonRetour_pressed)

# Fonction qui s'exécute lorsque le bouton est pressé
func _on_BoutonRetour_pressed():
	get_tree().change_scene_to_file("res://MenuPrincipal.tscn")  # Remplace par le chemin de ta scène MenuPrincipal
