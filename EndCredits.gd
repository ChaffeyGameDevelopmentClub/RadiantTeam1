extends Node2D

@onready var gif:AnimatedSprite2D=$AnimatedSprite2D
@onready var text:RichTextLabel=$RichTextLabel
var speed=1
	
func _physics_process(_delta):
	gif.play("gif")
	text.position.y-=speed
	
