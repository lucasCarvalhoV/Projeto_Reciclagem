extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Globals.health == 0):
		show()
		$Resultado.add_theme_color_override("font_color","Red")
		$Resultado.text = "Game Over"
		get_tree().paused = true
	elif(Globals.points == 30):
		show()
		$Resultado.add_theme_color_override("font_color","Green")
		$Resultado.text = "Vitória"
		get_tree().paused = true


func _on_jogar_novamente_pressed():
	get_tree().change_scene_to_file("res://scenes/Principal.tscn")
	
	pass # Replace with function body.


func _on_sair_pressed():
	get_tree().quit()
	pass # Replace with function body.
