extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var text:RichTextLabel=$"../CanvasLayer/TextEdit"
@onready var bedTarget:Area2D=$"../BedArea"
@onready var bedSprite:Sprite2D=$"../BedSprite"
@onready var control:CharacterBody2D=$"."
@onready var spriteChange:Sprite2D=$Sprite2D
@onready var shelfTarget:Area2D=$"../ShelfArea"
@onready var shelfSprite:Sprite2D=$"../ShelfSprite"
@onready var shelfCol:CollisionShape2D=$"../ShelfArea/CollisionShape2D"
@onready var bedCol:CollisionShape2D=$"../BedArea/CollisionShape2D"
@onready var girlIcon:Sprite2D=$"../BlueGirl"
@onready var text2:RichTextLabel=$"../CanvasLayer/TextEdit2"
@onready var cat:Sprite2D=$"../cat"
@onready var book:Sprite2D=$"../book"
@onready var therapist:Sprite2D=$"../Therapist"
@onready var finalShelf:Sprite2D=$"../finalShelf"
@onready var button:TextureButton=$"../CanvasLayer/button"
@onready var FINAL:ColorRect=$"../FINAL"
@onready var lastButton:TextureButton=$"../FINAL/PhoneBook"
var i=0
var blueDialogue=["Hi doc. Ive been rotting\n in bed for like a week\n now all depressed.",
"Rude. Anyways... I dont\nknow what to do",
"Yeah i guess...",
"Now what?",
"What about my cat?",
"Where should I put my\nHunterxHunter manga?",
"My room feels more clean\nnow. I almost wanna be\nproductive now.",
"Im too broke to pay\nyou so heres my HxH\nvolume 11."]
var therapistDialogue=["I can tell","Maybe you would feel\nbetter if we cleaned\nthis messy room",
"Maybe start by\nmoving your bed\nto the corner(WASD perchance)",
"Move your desk to\nmaybe not in the middle\n of the room",
"Put her somewhere on\nthe bed.(Click the bed maybe)",
"I dont know what that is\nbut probaly on the\ndesk",
"Well I hope you will be",
"I still dont know what\nthat is but thank you"]
func _ready():
	set_physics_process(false)
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
	shelfSprite.hide()
	control.position.x=32
	control.position.y=160
	control.scale.x=1
	control.scale.y=0.75
	spriteChange.texture=load("res://Assets/Blue/desk.png")
	shelfCol.call_deferred("set","disabled",false)
	button.show()

func _on_shelf_area_body_entered(body):
	shelfTarget.hide()
	spriteChange.hide()
	finalShelf.show()
	button.show()
	set_physics_process(false)

func _input(event):
	if event.is_pressed() and Input.is_action_just_pressed("leftClick"):
		if event.position.x>1 and event.position.x<180 and event.position.y>10 and event.position.y<300:
			cat.position.x=event.position.x/2.5
			cat.position.y=event.position.y/2.6
			button.show()
		elif event.position.x>300 and event.position.x<530 and event.position.y>15 and event.position.y<90:
			book.position.x=event.position.x/2.5
			book.position.y=event.position.y/2.5
			button.show()
			

func finishGame():
	FINAL.show()
	
	
func _on_texture_button_button_down():
	i+=1
	if i<8:
		text.text=blueDialogue[i]
		text2.text=therapistDialogue[i]
	if i==2:
		set_physics_process(true)
		bedTarget.show()
		button.hide()
	elif i==3:
		shelfTarget.show()
		button.hide()
	elif i==4:
		button.hide()
	elif i==5:
		button.hide()
	elif i==8:
		button.hide()
		finishGame()


func _on_audio_stream_player_finished():
	$"../BackGround/AudioStreamPlayer".play()
