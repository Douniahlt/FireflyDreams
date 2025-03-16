extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Appliquer la gravité
	if not is_on_floor():
		velocity.y += gravity * delta

	# Gérer le saut
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
	# Gestion du mouvement horizontal
	var move_direction = 0  # Variable pour stocker la direction
	var move_direction_haut = 0 #pareil
	if Input.is_action_pressed("ui_right"):
		move_direction = 1
		$AnimatedSprite2D.scale.x = 5  # Face à droite
		$AnimatedSprite2D.play("Walk")
	if Input.is_action_pressed("ui_left"):
		move_direction = -1
		$AnimatedSprite2D.scale.x = -5  # Face à gauche
		$AnimatedSprite2D.play("Walk")
	if Input.is_action_pressed("ui_up"):
		move_direction_haut = -1
		$AnimatedSprite2D.play("up")
	if Input.is_action_pressed("ui_down"):
		move_direction_haut = 1
		$AnimatedSprite2D.play("down")
	if Input.is_action_pressed("e"):
		move_direction_haut = 1
		$AnimatedSprite2D.play("Descendre l'echelle")
	# Mettre à jour la vitesse horizontale
	velocity.x = move_direction * SPEED
	velocity.y = move_direction_haut * SPEED
	# Si aucune touche de déplacement n'est pressée, passer à l'animation "Stand"
	if move_direction == 0 && move_direction_haut == 0:
		$AnimatedSprite2D.play("Stand")

	move_and_slide()

