extends Node

var player = null
var health = 5
var points = 0
var initial_position = null
var lixo_recolhido = null
signal death

func respawn_player_to_start():
	player.position = initial_position
	
func decrease_health():
	health -= 1
	if(health == 0):
		death.emit()
	
func increase_points():
	points += 10

func picked_garbage(message):
	lixo_recolhido = message
