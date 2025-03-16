extends Node

@onready var music = $AudioStreamPlayer

func _ready():
	if music == null:
		print("❌ ERREUR : AudioStreamPlayer non trouvé ! Vérifie la hiérarchie.")
	else:
		print("✅ AudioStreamPlayer trouvé !")

# Fonction pour changer la musique
func play_music():
	music.play()  # Joue la musique
func stop_music():
	music.stop()
