extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var manager

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	manager = get_node("OrangeManager")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if position.y > 700:
		queue_free()
	move_and_slide()
	
