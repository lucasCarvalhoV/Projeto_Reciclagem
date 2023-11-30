extends Node

@onready var player = $player as CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.player = player
	Globals.initial_position = player.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
