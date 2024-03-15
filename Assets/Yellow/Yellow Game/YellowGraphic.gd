extends Sprite2D

var exitGame

@export var YellowTimer : Node
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	exitGame = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and exitGame:
		get_tree().change_scene_to_file("res://Assets/Orange/Orange Game/orange_game.tscn")


func _on_graphic_fade_timer_timeout():
	visible = false
func win_block_game():
	visible = true
	texture = load("res://Assets/Yellow/Yellow Game/Yellow Game Win.png")
	exitGame = true
func lose_block_game():
	visible = true
	texture = load("res://Assets/Yellow/Yellow Game/Yellow Game Lose.png")
	exitGame = true
