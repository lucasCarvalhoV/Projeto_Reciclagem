extends Control

@onready var rightChoice = $RightChoice
@onready var wrongChoice = $WrongChoice

var cor_lata_de_lixo = "vermelho"
var cor_lixos = []
var player = null;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_lata_de_lixo_depositou_lixo(body, area):
	player = body;
	cor_lata_de_lixo = area.color
	if(visible == false):
		show()
		for item in body.collectedGarbage:
			$ItemList.add_item(item.Tipo)
			cor_lixos.append(item.Cor)
	else:
		hide()
		$ItemList.clear()
		cor_lixos = []
	pass # Replace with function body.


func _on_item_list_item_activated(index):
	if(cor_lata_de_lixo == cor_lixos[index]):
		Globals.increase_points()
		rightChoice.play()
	else:
		wrongChoice.play()
		Globals.decrease_health()
	$ItemList.remove_item(index)
	player.collectedGarbage.remove_at(index);
	cor_lixos.remove_at(index);
