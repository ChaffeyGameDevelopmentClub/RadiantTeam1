extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: Vector2=Vector2.ZERO


func _physics_process(delta):
	direction = Input.get_vector("left", "right","up","down")
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y=direction.y*SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y=move_toward(velocity.y,0,SPEED)

	move_and_slide()

func _on_col_1_body_entered(body):
	print("slay")
