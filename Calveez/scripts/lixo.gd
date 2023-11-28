extends Area2D
@export var cor = "Vermelho"  # Exemplo: vermelho

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pick_garbage():
	if visible == true:
		print("pegou o lixo")
		#queue_free() #Coloca visible para false escondendo o nó

func _on_body_entered(body):
		if body.is_in_group("player"):
			if body.collectedGarbage.size() < 6:
				var tipo = "Lata";
				body.collectedGarbage.append({"Cor": cor, "Tipo":tipo})
				print(body.collectedGarbage)
				pick_garbage()
			else:
				print("Seu saco ta cheio");


