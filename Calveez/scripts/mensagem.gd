extends Control

var tempo = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.lixo_recolhido != null:
		$MsgLabel.text = "Você pegou " + str(Globals.lixo_recolhido)
		show()
	pass


func _on_timer_timeout():
	if Globals.lixo_recolhido != null:
		tempo -= 1
	
	if (tempo == 0):
		hide()
		Globals.lixo_recolhido = null
		tempo = 3
