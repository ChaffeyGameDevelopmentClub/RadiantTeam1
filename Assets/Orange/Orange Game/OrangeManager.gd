extends Node2D
@export var Orange : PackedScene
var score
@export var Dialogue : String
var patientDialogue
var playerDialogue
var label
var playerDialogueActive
var patientDialogueActive
var rng = RandomNumberGenerator.new()
var orangeTimer
var orangeGraphic
var dialogueTimer
var graphicFadeTimer
var dialoguePhase
# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	label =  get_tree().current_scene.get_node("ScoreLabel")
	orangeGraphic =  get_tree().current_scene.get_node("OrangeGraphic")
	orangeTimer =  get_node("OrangeTimer")
	patientDialogue =  get_tree().current_scene.get_node("patientDialogue")
	playerDialogue =  get_tree().current_scene.get_node("playerDialogue")
	dialogueTimer =  get_node("DialogueTimer")
	graphicFadeTimer =  orangeGraphic.get_node("GraphicFadeTimer")
	patientDialogue.set_text("This is a robbery. Give me all of your oranges.")
	playerDialogue.set_text("Please no. I need my oranges.")
	patientDialogueActive = true
	playerDialogueActive = false
	patientDialogue.set_visible_ratio(0)
	playerDialogue.set_visible_ratio(0)
	dialoguePhase = 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("E"):
		spawnOrange()
	if score > 5:
		orangeGraphic._win_catch_game()
		orangeTimer.stop()
		
	if playerDialogueActive:
		if playerDialogue.get_visible_ratio() < 1.0:
			playerDialogue.set_visible_ratio(playerDialogue.get_visible_ratio() + 0.01)
	if patientDialogue.get_visible_ratio() >= 0.99 and playerDialogueActive == false:
		playerDialogueActive = true
	if patientDialogueActive:
		if patientDialogue.get_visible_ratio() < 1.0:
			patientDialogue.set_visible_ratio(patientDialogue.get_visible_ratio() + 0.01)
	if patientDialogueActive and playerDialogueActive:
		if patientDialogue.get_visible_ratio() >= 0.99 and playerDialogue.get_visible_ratio() >= 0.99:
			if dialoguePhase == 1:
				dialogueTimer.start()
			patientDialogueActive = false
			playerDialogueActive = false
	if score == 3 and dialoguePhase == 1:
		dialoguePhase = 2
		patientDialogue.set_text("I love stealing oranges.")
		playerDialogue.set_text("You are evil.")
		patientDialogue.set_visible_ratio(0)
		playerDialogue.set_visible_ratio(0)
		patientDialogueActive = true
		playerDialogueActive = false
	if score == 6 and dialoguePhase == 2:
		dialoguePhase = 3
		patientDialogue.set_text("Wow, I can now see the error of my ways. Thank you doctor.")
		playerDialogue.set_text("Yes. Now get out of my house.")
		patientDialogue.set_visible_ratio(0)
		playerDialogue.set_visible_ratio(0)
		patientDialogueActive = true
		playerDialogueActive = false

func spawnOrange():
	rng.randf_range(-10.0, 10.0)
	position = Vector2(rng.randf_range(50.0, 600.0),rng.randf_range(-10.0, 10.0))
	var O = Orange.instantiate()
	add_child(O)

func _on_timer_timeout():
	spawnOrange()

func increaseScore():
	score = score + 1
	label.setText("Score: " + str(score))

func _on_dialogue_timer_timeout():
	orangeGraphic.visible = true
	graphicFadeTimer.start()
	
