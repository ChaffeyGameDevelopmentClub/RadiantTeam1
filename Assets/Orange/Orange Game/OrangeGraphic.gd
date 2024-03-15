extends Sprite2D

var exitGame

@export var OrangeTimer : Node
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	exitGame = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and exitGame:
		get_tree().change_scene_to_file("res://Assets/Yellow/Yellow Game/yellow_game.tscn")


func _on_graphic_fade_timer_timeout():
	visible = false
	OrangeTimer.start()
func _win_catch_game():
	visible = true
	texture = load("res://Assets/Orange/Orange Game/Orange Win Graphic.png")
	exitGame = true
