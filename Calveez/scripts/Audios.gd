extends Control

@onready var morte = $Death
@onready var coletar = $GarbageCollected
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fim_de_jogo_death():
	print("morte")
	morte.play()
	pass # Replace with function body.
