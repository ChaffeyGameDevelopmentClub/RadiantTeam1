extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var text:TextEdit=$"../CanvasLayer/TextEdit"
@onready var bedTarget:Area2D=$"../BedArea"
@onready var bedSprite:Sprite2D=$"../BedSprite"
@onready var control:CharacterBody2D=$"."
@onready var spriteChange:Sprite2D=$Sprite2D
@onready var shelfTarget:Area2D=$"../ShelfArea"
@onready var shelfSprite:Sprite2D=$"../ShelfSprite"
@onready var shelfCol:CollisionShape2D=$"../ShelfArea/CollisionShape2D"
@onready var bedCol:CollisionShape2D=$"../BedArea/CollisionShape2D"
@onready var girlIcon:Sprite2D=$"../BlueGirl"
@onready var text2:TextEdit=$"../CanvasLayer/TextEdit2"
@onready var teddyBear:Sprite2D=$"../teddyBear"
@onready var book:Sprite2D=$"../book"
@onready var therapist:Sprite2D=$"../Therapist"



func _physics_process(delta):
	if not Input.is_action_just_pressed("leftClick"):
		var direction = Input.get_vector("left", "right","up","down")
		if direction:
			velocity.x = direction.x * SPEED
			velocity.y = direction.y * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _on_bed_area_body_entered(body):
	bedSprite.show()
	bedTarget.hide()
	shelfTarget.show()
	control.position.x=150
	control.position.y=180
	spriteChange.texture=load("res://BoxingGame/red.png")
	text.text="Can you move \n my desk now"
	
	shelfCol.call_deferred("set","disabled",false)

func _on_shelf_area_body_entered(body):
	shelfSprite.show()
	shelfTarget.hide()
	spriteChange.hide()
	set_physics_process(false)
	text.text="Please put my teddy \nbear somewhere \non the bed"
	
	

func _input(event):
	if event.is_pressed() and Input.is_action_just_pressed("leftClick"):
		if event.position.x>0 and event.position.x<75 and event.position.y>0 and event.position.y<125:
			teddyBear.show()
			teddyBear.position.x=event.position.x
			teddyBear.position.y=event.position.y
			text.text="Lastly can you \nput my book \non my desk"
		elif event.position.x>110 and event.position.x<200 and event.position.y>0 and event.position.y<50:
			book.show()
			book.position.x=event.position.x
			book.position.y=event.position.y
			finishGame()

func finishGame():
	text.text="thanks queen \nfor doing all dat"
	therapist.show()
	text2.show()


