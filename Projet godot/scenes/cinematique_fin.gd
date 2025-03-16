extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size = get_viewport_rect().size  # Taille de l'écran
	# Récupère la texture actuelle de l'animation en cours
	var sprite = $"Cinématique fin win"
	var texture_size = sprite.sprite_frames.get_frame_texture(sprite.animation, 0).get_size()
	# Calcul du facteur de mise à l'échelle
	var scale_x = viewport_size.x / texture_size.x
	var scale_y = viewport_size.y / texture_size.y
	# Appliquer l'échelle pour couvrir tout l'écran
	sprite.scale = Vector2(scale_x, scale_y)
	$"Cinématique fin win".play("cinématique win")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var viewport_size = get_viewport_rect().size  # Taille de l'écran
	# Récupère la texture actuelle de l'animation en cours
	var sprite = $"Cinématique fin win"
	var texture_size = sprite.sprite_frames.get_frame_texture(sprite.animation, 0).get_size()
	# Calcul du facteur de mise à l'échelle
	var scale_x = viewport_size.x / texture_size.x
	var scale_y = viewport_size.y / texture_size.y
	# Appliquer l'échelle pour couvrir tout l'écran
	sprite.scale = Vector2(scale_x, scale_y)


func _on_texture_button_pressed():
	pass # Replace with function body. sort du programme


func _on_cinématique_fin_win_animation_finished():
	MusicManager.stop_music()
	get_tree().quit()

