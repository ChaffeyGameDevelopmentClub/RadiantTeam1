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
@onready var cat:Sprite2D=$"../cat"
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
	spriteChange.texture=load("res://Assets/Blue/desk.png")
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
		if event.position.x>1 and event.position.x<180 and event.position.y>10 and event.position.y<300:
			cat.position.x=event.position.x/2.5
			cat.position.y=event.position.y/2.6
			cat.show()
			text.text="Lastly can you \nput my book \non my desk"
		elif event.position.x>300 and event.position.x<530 and event.position.y>15 and event.position.y<90:
			book.show()
			book.position.x=event.position.x/2.5
			book.position.y=event.position.y/2.5
			finishGame()

func finishGame():
	text.text="thanks queen \nfor doing all dat"
	therapist.show()
	text2.show()


