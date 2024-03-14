extends Control
@onready var main = $Menu
@onready var Pause = $Pause_Button

func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true
	
func testEsc():
	if Input.is_action_just_pressed("Pause") and get_tree().paused ==false:
		pause()
	elif Input.is_action_just_pressed("Pause") and get_tree().paused ==true:
		resume()

func _on_continue_pressed():
	resume()
	
func _on_back_to_tilte_screen_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_level_selection_pressed():
	#For the phonebook get_tree().change_scene_to_file()
	
	func _process(delta):
		testEsc()
