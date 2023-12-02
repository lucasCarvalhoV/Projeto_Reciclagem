extends Node

var player = null
var health = 5
var initial_position = null

func respawn_player_to_start():
	player.position = initial_position
	
func decrease_health():
	health -= 1
