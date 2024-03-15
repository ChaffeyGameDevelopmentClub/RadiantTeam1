extends Control

@onready var redButton:TextureButton=$RedScene
@onready var orangeButton:TextureButton=$OrangeScene
@onready var yellowButton:TextureButton=$YellowScene
@onready var blueButton:TextureButton=$BlueScene4




func _on_red_scene_button_down():
	get_tree().change_scene_to_file("res://BoxingMG.tscn")


func _on_orange_scene_button_down():
	get_tree().change_scene_to_file("res://Assets/Orange/Orange Game/orange_game.tscn")


func _on_yellow_scene_button_down():
	get_tree().change_scene_to_file("res://Assets/Yellow/Yellow Game/yellow_game.tscn")


func _on_blue_scene_4_button_down():
	get_tree().change_scene_to_file("res://CleaningRoom.tscn")
