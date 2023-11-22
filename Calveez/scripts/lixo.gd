extends Area2D
@export var cor = "Vermelho"  # Exemplo: vermelho

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pickble():
	if visible == true:
		print("pegou o lixo")
		hide() #Coloca visible para false escondendo o nó

func _on_body_entered(body):
	if body.is_in_group("player"):
		if body.is_holding == false:
			body.is_holding = true
			body.object_color = cor
			pickble()


