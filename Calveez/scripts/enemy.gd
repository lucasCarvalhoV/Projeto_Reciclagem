extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var direction = -1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var wall_detector = $wall_detector as RayCast2D
@onready var texture = $Sprite2D as Sprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# detectar se o tocou na parede
	if wall_detector.is_colliding():
		direction *= -1 #para inverter o movimento
		texture.scale.x *= -1 #para inverter o sprite
		wall_detector.scale.x *= -1 #para inverter o raycast e detectar colisão do outro lado quando virar
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
