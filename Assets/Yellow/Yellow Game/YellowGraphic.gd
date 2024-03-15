extends Sprite2D

@export var YellowTimer : Node
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_graphic_fade_timer_timeout():
	visible = false
func win_block_game():
	visible = true
	texture = load("res://Orange Game/Orange Win Graphic.png")
func lose_block_game():
	visible = true
	texture = load("res://Orange Game/Orange Win Graphic.png")
