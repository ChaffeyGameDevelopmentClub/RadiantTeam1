extends Node2D


@onready  var start:TextureButton=$PlayButton


func _on_play_button_button_down():
	get_tree().change_scene_to_file("res://level_selection.tscn")
