extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"niveau 2/Area2D2".show()
	$"niveau 2/Area2D3".hide()
	$"niveau 2/Area2D4".hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_2_area_entered(area):
	pass


func _on_area_2d_3_area_entered(area):
	pass

func _on_area_2d_4_area_entered(area):
	pass


func _on_area_2d_2_body_entered(body):
	$"niveau 2/Area2D2".hide()
	$"niveau 2/Area2D3".show()
	print("entre1")


func _on_area_2d_3_body_entered(body):
	$"niveau 2/Area2D3".hide()
	$"niveau 2/Area2D4".show()
	print("entre2")


func _on_area_2d_4_body_entered(body):
	$"niveau 2/Area2D4".hide()
	print("entre3")


func _on_porte_2_body_entered(body):
	call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://scenes/nv3.tscn")

