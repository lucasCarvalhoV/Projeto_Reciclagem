extends Node2D

const WAIT = 2.0
@onready var platform = $AnimatableBody2D as AnimatableBody2D
@export var mov_speed = 5.0
@export var distance = 192
@export var move_horizontal = true

var follow = Vector2.ZERO
var platform_center = 16
# Called when the node enters the scene tree for the first time.
func _ready():
	move_platform()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	platform.position = platform.position.lerp(follow,0.5)
	pass
	
func move_platform():
	# se move_horizontal é true então o valor será Vector2.Right senão será Vector2.UP
	var move_diretion = Vector2.RIGHT*distance if move_horizontal else Vector2.UP*distance
	var duration = move_diretion.length()/float(mov_speed*platform_center)
	
	# criação de tween var nome = create_tween()
	# set_loops indica quantas vezes se repetirá, sem nenhum argumento fará infinitas vezes
	# set_trans: tipo de transição
	# set_ease: tipo de suavização
	var platform_tween = create_tween().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	#movimento de ida
	# set_delay: tempo de atraso
	platform_tween.tween_property(self,"follow",move_diretion,duration).set_delay(WAIT)
	#movimento de volta
	platform_tween.tween_property(self,"follow",Vector2.ZERO,duration).set_delay(duration + WAIT*2)
