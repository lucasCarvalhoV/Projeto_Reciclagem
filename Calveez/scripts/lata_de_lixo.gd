extends Area2D
@export var color = "vermelho"  # Exemplo: vermelho

signal depositou_lixo(body,area)
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
		if body.collectedGarbage.size() > 0:
			print("depositou")


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
#		print(color)
		var player = get_node("/root/Principal/player")
		if player != null:
			emit_signal("depositou_lixo", player,self)

