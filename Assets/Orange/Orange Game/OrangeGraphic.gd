extends Sprite2D

@export var OrangeTimer : Node
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_graphic_fade_timer_timeout():
	visible = false
	OrangeTimer.start()
func _win_catch_game():
	visible = true
	texture = load("res://Assets/Orange/Orange Game/Orange Win Graphic.png")
