extends Area2D
#@export var cor = "Vermelho"  # Exemplo: vermelho
var tipo_lixo = null
var tipo = null
var cores = ["vermelho", "azul", "verde", "amarelo"]
var glass_trash = preload("res://sprites/glass_trash.png")
var paper_trash = preload("res://sprites/paper_trash.png")
var plastic_trash = preload("res://sprites/plastic_trash.png")
var metal_trash = preload("res://sprites/metal_trash.png")

@onready var collected = get_node("/root/Principal/player/GarbageCollected")
# Called when the node enters the scene tree for the first time.
func _ready():
	var cor = _get_color()
	tipo = _get_lixo(cor)
	tipo_lixo = {"Cor": cor, "Tipo":tipo}
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pick_garbage():
	if visible == true:
		Globals.picked_garbage(tipo)
#		print("pegou o lixo")
		queue_free() #Coloca visible para false escondendo o nó

func _on_body_entered(body):
		if body.is_in_group("player"):
			if body.collectedGarbage.size() < 6:
				collected.play()
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
	$Sprite2D.scale.x = 0.06
	$Sprite2D.scale.y = 0.06
	if(cor == "vermelho"):
		$Sprite2D.texture = plastic_trash
		return "Garrafa de Plástico"
	elif(cor == "azul"):
		$Sprite2D.texture = paper_trash
		return "Papel Amassado"
	elif(cor == "verde"):
		$Sprite2D.texture = glass_trash
		return "Garrafa Quebrada"
	elif(cor == "amarelo"):
		$Sprite2D.texture = metal_trash
		return "Latinha"

