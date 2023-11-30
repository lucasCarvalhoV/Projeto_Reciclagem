extends Area2D

@onready var collision = $final_do_mapa_collision as CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_body_entered(body):
	if body.name == "player" && body.has_method("_fall_in_void"):
		body._fall_in_void()
		print("caiu no void")
	
