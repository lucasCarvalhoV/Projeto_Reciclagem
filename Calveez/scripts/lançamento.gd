extends RigidBody2D

var launch_speed = 300 # Velocidade inicial do lançamento
var angle = 45 # Ângulo inicial do lançamento
var is_launching = false

func _ready():
	gravity_scale = 0
	pass

func _process(delta):
	if Input.is_action_pressed("click") and !is_launching:
		is_launching = true
		var mouse_position = get_global_mouse_position()
		var launch_direction = (mouse_position - global_position).normalized()
		angle = atan2(launch_direction.y, launch_direction.x)
		var launch_vector = Vector2(cos(angle), sin(angle)) * launch_speed
		apply_impulse(global_position, launch_vector)

	if is_launching and linear_velocity.length() < 10:
		is_launching = false
		gravity_scale = 1
		queue_free()
