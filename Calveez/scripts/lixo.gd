extends Area2D
#@export var cor = "Vermelho"  # Exemplo: vermelho
var tipo_lixo = null
var cores = ["vermelho", "azul", "verde", "amarelo"]
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var cor = _get_color()
	var tipo = _get_lixo(cor)
	tipo_lixo = {"Cor": cor, "Tipo":tipo}
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pick_garbage():
	if visible == true:
		print("pegou o lixo")
		queue_free() #Coloca visible para false escondendo o nó

func _on_body_entered(body):
		if body.is_in_group("player"):
			if body.collectedGarbage.size() < 6:
				body.collectedGarbage.append(tipo_lixo)
				print(body.collectedGarbage)
				pick_garbage()
			else:
				print("Seu saco ta cheio");

func _get_color():
	var randomIndex = randi() % cores.size()
	var randomValue = cores[randomIndex]
	return randomValue

func _get_lixo(cor):
	var tipos_lixo = [];
	
	if(cor == "vermelho"):
		tipos_lixo = ["Garrafa de Plástico", "Copo Descartável"]
	elif(cor == "azul"):
		tipos_lixo = ["Papel Amassado", "Sacola de Papel"]
	elif(cor == "verde"):
		tipos_lixo = ["Garrafa Quebrada"]
	elif(cor == "amarelo"):
		tipos_lixo = ["Latinha"]
	
	var randomIndex = randi() % tipos_lixo.size()
	var randomValue = tipos_lixo[randomIndex]
	return randomValue

