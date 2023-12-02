extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Contador.text = str("%02d" % Globals.health)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Contador.text = str("%02d" % Globals.health)
	print(Globals.health)
	pass
