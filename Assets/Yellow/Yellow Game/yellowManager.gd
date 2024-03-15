extends Node2D

var turns = 0
var score = 0
var turnsText
var nextDemolition = 20
var demolitionBox
var scoreText
var demolitionsLeft
var demolitionsText
var patientDialogue
var playerDialogue
var playerDialogueActive
var patientDialogueActive
var yellowTimer
var yellowGraphic
var dialogueTimer
var graphicFadeTimer
var dialoguePhase
var gameActive
var gameOver
# Called when the node enters the scene tree for the first time.
func _ready():
	turnsText = get_tree().current_scene.get_node("turnsText")
	scoreText = get_tree().current_scene.get_node("scoreText")
	demolitionsText = get_tree().current_scene.get_node("demolitionsText")
	demolitionBox = get_tree().current_scene.get_node("DemolitionBox")
	turnsText.set_text("Next demolition in " + str(nextDemolition) + " turns.")
	demolitionsLeft = 4
	gameOver = false
	yellowGraphic =  get_tree().current_scene.get_node("YellowGraphic")
	yellowTimer =  get_node("YellowTimer")
	patientDialogue =  get_tree().current_scene.get_node("patientDialogue")
	playerDialogue =  get_tree().current_scene.get_node("playerDialogue")
	dialogueTimer =  get_node("DialogueTimer")
	graphicFadeTimer =  yellowGraphic.get_node("GraphicFadeTimer")
	patientDialogue.set_text("Build stuff using these blocks. It'll get destroyed soon.")
	playerDialogue.set_text("That's unfortunate.")
	patientDialogueActive = true
	playerDialogueActive = false
	patientDialogue.set_visible_ratio(0)
	playerDialogue.set_visible_ratio(0)
	dialoguePhase = 1
	gameActive = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	if score > 499 and dialoguePhase == 1:
		dialoguePhase = 2
		patientDialogue.set_text("You are doing an acceptable job.")
		playerDialogue.set_text("Okay.")
		patientDialogue.set_visible_ratio(0)
		playerDialogue.set_visible_ratio(0)
		patientDialogueActive = true
		playerDialogueActive = false
	if gameOver == true and dialoguePhase == 2:
		if score > 1000:
			dialoguePhase = 3
			yellowGraphic.win_block_game()
			patientDialogue.set_text("My fear of a random bulldozer destoying my house is gone. Thank you doctor.")
			playerDialogue.set_text("Yes. That is good.")
			patientDialogue.set_visible_ratio(0)
			playerDialogue.set_visible_ratio(0)
			patientDialogueActive = true
			playerDialogueActive = false
		else:
			dialoguePhase = 3
			yellowGraphic.lose_block_game()
			patientDialogue.set_text("Doctor you have failed. I still have a crippling fear of bulldozers destroying my house.")
			playerDialogue.set_text("Oh no. Anyway, here's your bill for a thousand dollars.")
			patientDialogue.set_visible_ratio(0)
			playerDialogue.set_visible_ratio(0)
			patientDialogueActive = true
			playerDialogueActive = false

func add_score(scoreInput):
	score += scoreInput
	scoreText.set_text("Score: " + str(score))

func add_turn():
	turns += 1
	nextDemolition -= 1
	if nextDemolition == 0:
		demolitionsLeft -= 1
		demolitionsText.set_text("Demolitions left: " + str(demolitionsLeft))
		demolitionBox.demolition_time()
		turnsText.set_text("Demolition time.")
		if demolitionsLeft < 1:
			gameActive = false

	elif nextDemolition == -1:
		nextDemolition = 20
		turnsText.set_text("Next demolition in " + str(nextDemolition) + " turns.")
	else:
		turnsText.set_text("Next demolition in " + str(nextDemolition) + " turns.")


func _on_dialogue_timer_timeout():
	yellowGraphic.visible = true
	graphicFadeTimer.start()

func demolition_over():
	if demolitionsLeft == 0:
		gameOver = true

func _on_graphic_fade_timer_timeout():
	gameActive = true
