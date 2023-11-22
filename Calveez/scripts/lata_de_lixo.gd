extends Area2D
@export var color = "vermelho"  # Exemplo: vermelho

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(color == "vermelho"):
		$Sprite2D.frame = 0
	elif(color == "verde"):
		$Sprite2D.frame = 1
	elif(color == "amarelo"):
		$Sprite2D.frame = 2
	elif(color == "azul"):
		$Sprite2D.frame = 3
	



func _on_body_entered(body):
	if body.is_in_group("player"):
		if body.is_holding:
			body.is_holding = false
			if body.object_color == color:
				print("Lata de Lixo certa")
			else:
				print("Lata de Lixo errada")
