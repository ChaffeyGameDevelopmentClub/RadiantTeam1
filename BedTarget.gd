extends Area2D

@onready var teddyBear:Sprite2D=$"../teddyBear"
@onready var book:Sprite2D=$"../book"


func teddyPlace(event):
	print("say")
	if event.is_pressed():
		if event.position.x>0 and event.position.x<75 and event.position.y>0 and event.position.y<125:
			teddyBear.show()
			teddyBear.position.x=event.position.x
			teddyBear.position.y=event.position.y


