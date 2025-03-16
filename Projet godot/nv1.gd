extends Node2D

var nb_lucioles = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size = get_viewport_rect().size  # Taille de l'écran
	var texture_size = $"niveau 1/Fond 1".texture.get_size()  # Taille de la texture d'origine

	# Calcul du facteur de mise à l'échelle
	var scale_x = viewport_size.x / texture_size.x
	var scale_y = viewport_size.y / texture_size.y
	$Area2D5/StaticBody2D/CollisionShape2D3.set_disabled(false)
	# Appliquer l'échelle pour couvrir tout l'écran
	$"niveau 1/Fond 1".scale = Vector2(scale_x, scale_y)
	print($Area2D5/StaticBody2D/CollisionShape2D3.is_disabled())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_area_2d_area_entered(area):
	if area == $Personnage/Area2D:
		nb_lucioles -= 1
		call_deferred("remove_area2d", $Area2D)


func _on_area_2d_2_area_entered(area):
	if area == $Personnage/Area2D:
		nb_lucioles -= 1
		call_deferred("remove_area2d", $Area2D2)


func _on_area_2d_3_area_entered(area):
	if area == $Personnage/Area2D:
		nb_lucioles -= 1
		call_deferred("remove_area2d", $Area2D3)


func _on_area_2d_4_area_entered(area):
	if area == $Personnage/Area2D:
		nb_lucioles -= 1
		call_deferred("remove_area2d", $Area2D4)

func remove_area2d(area: Area2D):
	area.queue_free()  # Supprimer le nœud


func _on_area_2d_5_area_entered(area):
	print("entrééééé")
	if (area == $Personnage/Area2D) and (nb_lucioles == 0):
		call_deferred("remove_child", $Area2D5)


func _on_area_2d_5_body_entered(body):
	print("entrééééé body")
	print(nb_lucioles)
	if (body == $Personnage) and (nb_lucioles == 0):
		print("enleve porte")
		print($Area2D5/StaticBody2D/CollisionShape2D3.is_disabled())
		#$Area2D5/StaticBody2D/CollisionShape2D3.set_disabled(true)
		call_deferred("disable_door_collision")

# Fonction pour désactiver la collision de la porte
func disable_door_collision():
	$Area2D5/StaticBody2D.set_collision_layer(10)  # Désactive le calque de collision
	$Area2D5/StaticBody2D.set_collision_mask(10)  #
	get_tree().change_scene_to_file("res://scenes/nv2_mieu.tscn")
