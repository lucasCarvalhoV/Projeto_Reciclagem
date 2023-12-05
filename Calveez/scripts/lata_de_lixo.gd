extends Area2D
@export var color = "vermelho"  # Exemplo: vermelho
@onready var collected = $GarbageCollected
signal depositou_lixo(body,area)
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	if(color == "vermelho"):
		$Sprite2D.frame = 0
	elif(color == "verde"):
		$Sprite2D.frame = 1
	elif(color == "amarelo"):
		$Sprite2D.frame = 2
	elif(color == "azul"):
		$Sprite2D.frame = 3
	elif (color == "random"):
		$Sprite2D.frame = _get_color();
	pass # Replace with function body.

func _get_color():
	var cores = [0, 1, 2, 3]
	var randomIndex = randi() % cores.size()
	var randomValue = cores[randomIndex]
	return randomValue

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
#		print(color)
		var player = get_node("/root/Principal/player")
		if player != null:
			emit_signal("depositou_lixo", player, self)

