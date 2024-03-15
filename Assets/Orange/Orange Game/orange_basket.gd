extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var manager : Node
# 120 - 445
func _ready():
	manager = get_tree().current_scene.get_node("OrangeManager")

func _physics_process(delta):
	# Add the gravity.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction > 0 and position.x < 445:
			velocity.x = direction * SPEED
		if direction < 0 and position.x > 120:
			velocity.x = direction * SPEED
		if position.x < 120 or position.x > 445:
			velocity.x = 0
			if position.x < 120:
				position.x = 121
			if position.x > 445:
				position.x = 444
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_just_pressed("q"):
		print(position.x)
	move_and_slide()


func _on_area_2d_body_entered(body):
	body.queue_free()
	manager.increaseScore()
