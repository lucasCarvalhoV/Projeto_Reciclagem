extends Node

@onready var player := $player as CharacterBody2D
@onready var player_scene = preload("res://scenes/player.tscn")

@onready var camera := $camera as Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.player = player
	Globals.initial_position = $Marker2D
	pass # Replace with function body.

func reload_game():
	await get_tree().create_timer(1.0).timeout
	var player = player_scene.instantiate()
	add_child(player)
	Globals.player = player
	Globals.respawn_player_to_start()
