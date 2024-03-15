extends Area2D
@onready var movingsprite:Sprite2D=$Moving
@onready var punchingbag:Sprite2D=$matchup
@onready var bar:ProgressBar=$ProgressBar
@onready var effect:AnimatedSprite2D=$puncheffect
@onready var therapist:Sprite2D=$"../Therapist"
@onready var redGuy:Sprite2D=$"../RedGuy"
@onready var line1:RichTextLabel=$"../CanvasLayer/line1"
@onready var line2:RichTextLabel=$"../CanvasLayer/line2"
@onready var button:TextureButton=$"../CanvasLayer/textButton"
@onready var FINAL:ColorRect=$"../FINAL"
#var mspos:float=movingsprite.position.x
#var pbpos:float=punchingbag.position.x
var pos=2
var speed=1.5
var i=0
var dialogueRed=["Yeah you know, stop punching\nholes in the wall in the break\nroom, don't break the keyboards, stuff like that.",
"Yeah doc, let's do it",
"Sooo the gym, doc? I expected\nlike, some sort of hula by\nthe beachside dude",
"Hey man this is pretty fun! Why\ndon't you give it a try",
"Wow, man, this is really some\nfire stuff you've shown me doc,\nI feel like I could send a thousand emails right now!",
"Here dude, I have a\nfeeling these things\nwill only slow me down."]
var dialogueTherapist=["I see, I think I know what you mean. Why don't we see if we can work that out in a… healthier manner?",
"Good",". . . Just punch the bag(Space Bar maybe idk)",
"Thanks, but I think I'll pass on\nruining my knuckles",
"Therapy is what works for\nyou… man. Im happy you found peace in throwing punches",
"Thanks but please\ndon't break any\nmore electronics."]
func _ready():
	set_physics_process(false)
	
func _on_text_button_pressed():
	if i<6:
		line1.text=dialogueRed[i]
		line2.text=dialogueTherapist[i]
	if i==2:
		set_physics_process(true)
	elif i==6:
		FINAL.show()
	else:
		i+=1
func _physics_process(_delta):
	movingsprite.position.x+=pos
	if bar.value==10:
		i=4
		line1.text=dialogueRed[i]
		line2.text=dialogueTherapist[i]
		set_physics_process(false)
	if bar.value>4 and bar.value<9:
		redGuy.texture=load("res://Assets/Red/red2.png")
		i=3
		line1.text=dialogueRed[3]
		line2.text=dialogueTherapist[3]
		
		
	if Input.is_action_just_pressed("space") and punchingbag.position.x<(movingsprite.position.x+40):
		effectplace()
		bagnewpos()
		bar.value+=1
		
		
	if movingsprite.position.x>=250:
		pos-=speed
	if movingsprite.position.x<=70:
		pos+=speed
	
		
func bagnewpos():
	punchingbag.position.x=randi_range(70,210)
	speed+=1

func effectplace():
	effect.position.x=randi_range(120,220)
	effect.position.y=randi_range(80,180)
	effect.show()
	effect.play("effect")



