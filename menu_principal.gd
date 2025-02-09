extends Control

func _ready():
	$VBoxContainer/BoutonJouer.pressed.connect(_on_Jouer_pressed)
	$VBoxContainer/BoutonComment.pressed.connect(_on_Comment_pressed)
	$VBoxContainer/BoutonQuitter.pressed.connect(_on_Quitter_pressed)

func _on_Jouer_pressed():
	get_tree().change_scene_to_file("res://terrain.tscn")  # Remplace par ta scène de jeu

func _on_Comment_pressed():
	get_tree().change_scene_to_file("res://commentJouer.tscn")  # Remplace par la scène 'Comment Jouer'

func _on_Quitter_pressed():
	get_tree().quit()
