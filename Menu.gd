extends Control
@onready var pause_button = $Pause_Button
var is_paused := false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	var Pause = false

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Pause_Menu():
	if is_paused:
		pause_button.hide()
		Engine.time_scale = 1 
	else:
		pause_button.show()
		Engine.time_scale = 0 
	
	is_paused = !is_paused



func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://level_selection.tscn")


func _on_quit_pressed():
	get_tree().quit()
