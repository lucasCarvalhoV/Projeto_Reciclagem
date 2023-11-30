extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping = false
@onready var anim = $AnimatedSprite2D

var collectedGarbage = []

#var is_holding = false
#var object_color = null

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
	elif is_on_floor():
		is_jumping = false
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		anim.scale.x = direction*0.2
		if !is_jumping:
			anim.play("walk")
	elif is_jumping:
		anim.play("jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.stop()

	move_and_slide()
	
	

func fall_in_void():
	Globals.respawn_player_to_start()
