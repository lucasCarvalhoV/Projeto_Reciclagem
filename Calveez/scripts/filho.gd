extends Node2D
var ob = preload("res://scenes/Objeto.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("click"):
		var projectile = ob.instantiate()
		get_parent().add_child(projectile)  # Adiciona o objeto como filho do nó principal.
		projectile.global_position = global_position  # Define a posição do objeto no mundo.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
