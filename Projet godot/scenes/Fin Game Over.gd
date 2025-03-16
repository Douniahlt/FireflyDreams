extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size = get_viewport_rect().size  # Taille de l'écran
	var texture_size = $"image Game over".texture.get_size()  # Taille de la texture d'origine

	# Calcul du facteur de mise à l'échelle
	var scale_x = viewport_size.x / texture_size.x
	var scale_y = viewport_size.y / texture_size.y
	# Appliquer l'échelle pour couvrir tout l'écran
	$"image Game over".scale = Vector2(scale_x, scale_y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var viewport_size = get_viewport_rect().size  # Taille de l'écran
	var texture_size = $"image Game over".texture.get_size()  # Taille de la texture d'origine

	# Calcul du facteur de mise à l'échelle
	var scale_x = viewport_size.x / texture_size.x
	var scale_y = viewport_size.y / texture_size.y
	# Appliquer l'échelle pour couvrir tout l'écran
	$"image Game over".scale = Vector2(scale_x, scale_y)

