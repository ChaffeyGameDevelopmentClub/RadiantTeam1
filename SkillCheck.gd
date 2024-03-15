extends Area2D
@onready var movingsprite:Sprite2D=$Moving
@onready var punchingbag:Sprite2D=$matchup
@onready var bar:ProgressBar=$ProgressBar
@onready var effect:AnimatedSprite2D=$puncheffect
@onready var redGuy2:Sprite2D=$"../RedGuy2"
@onready var line1:TextEdit=$"../CanvasLayer/line1"
@onready var line2:TextEdit=$"../CanvasLayer/line2"
#var mspos:float=movingsprite.position.x
#var pbpos:float=punchingbag.position.x
var pos=2
var speed=1


func _physics_process(_delta):
	movingsprite.position.x+=pos
	if bar.value==10:
		set_physics_process(false)
		redGuy2.show()
		line2.show()
	if bar.value==5:
		line1.text="Almost there!!"
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
