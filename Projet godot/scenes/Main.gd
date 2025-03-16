extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Control/Cinématique du début".stop()
	$"Control/Cinématique du début".hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	$"Control/Cinématique du début".play("Cinématique début")
	#$AudioStreamPlayer.play()
	var new_music = preload("res://asset/Son et musique/projet_godot_v1.mp3")  # Charge un fichier audio
	MusicManager.play_music()  # Joue la musique
	$Control/Start.hide()
	$"Control/Cinématique du début".show()


func _on_cinématique_du_début_animation_finished():
	get_tree().change_scene_to_file("res://scenes/niveau1.tscn")
