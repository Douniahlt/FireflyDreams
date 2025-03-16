extends Area2D

@export var type_lumiere: int = 0
@export var min_intensity: float = 0.5  # Intensité minimale
@export var max_intensity: float = 2.0  # Intensité maximale
@export var change_interval: float = 0.3  # Temps entre chaque changement (en secondes)

var timer = 0.0  # Chrono pour le changement d'intensité


# Called when the node enters the scene tree for the first time.
func _ready():
	if type_lumiere == 0:
		$Luciole.show()
		$Luciole2.hide()
		$Luciole3.hide()
	if type_lumiere == 1:
		$Luciole.hide()
		$Luciole2.show()
		$Luciole3.hide()
	if type_lumiere == 2:
		$Luciole.hide()
		$Luciole2.hide()
		$Luciole3.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer -= delta
	if timer <= 0:
		# Réinitialiser le chrono
		timer = change_interval
		if type_lumiere == 0:
			_change_light_intensity($Luciole/PointLight2D)

		elif type_lumiere == 1:
			_change_light_intensity($Luciole2/PointLight2D)
			_change_light_intensity($Luciole2/PointLight2D2)

		elif type_lumiere == 2:
			_change_light_intensity($Luciole3/PointLight2D)
			_change_light_intensity($Luciole3/PointLight2D2)
			_change_light_intensity($Luciole3/PointLight2D3)

# Fonction qui modifie l'intensité de la lumière avec des valeurs aléatoires
func _change_light_intensity(light: PointLight2D):
	var new_intensity = randf_range(min_intensity, max_intensity)  # Génère une valeur entre min et max
	light.energy = new_intensity
