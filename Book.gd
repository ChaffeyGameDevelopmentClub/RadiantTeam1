extends CharacterBody2D
@onready var text:TextEdit=$"../CanvasLayer/TextEdit"
@onready var book:Sprite2D=$Sprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _on_character_body_2d_check():
	text.text="can you move my bookshelf too"



# Get the gravity from the project settings to be synced with RigidBody nodes.
func _physics_process(delta):
	
	var direction = Input.get_vector("left", "right","up","down")
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
