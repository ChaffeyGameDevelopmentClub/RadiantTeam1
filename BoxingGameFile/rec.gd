extends Sprite2D


var speed=1

func _physics_process(delta):
	position.x+=speed
	
	if position.x>=150:
		speed-=1
	if position.x<=0:
		speed+=1

