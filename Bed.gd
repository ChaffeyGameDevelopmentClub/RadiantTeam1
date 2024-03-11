extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var text:TextEdit=$"../CanvasLayer/TextEdit"
@onready var bedTarget:Area2D=$"../BedArea"



func _physics_process(delta):
	
	var direction = Input.get_vector("left", "right","up","down")
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _on_bed_area_body_entered(body):
	set_physics_process(false)
	bedTarget.hide()
	position.x=5
	position.y=5
	text.text="YASSS"
	
	
