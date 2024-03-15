extends CharacterBody2D
var rng = RandomNumberGenerator.new()
@export var T1 : PackedScene
@export var T2 : PackedScene
@export var T3 : PackedScene
@export var T4 : PackedScene
@export var T5 : PackedScene
@export var T6 : PackedScene
@export var T7 : PackedScene
var T
var nextBlock
var nextBlockImage
var BlockImage
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var yellowManager
var canPlaceBlock
var blockPlaceTimer
# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	nextBlockImage = get_tree().current_scene.get_node("NextBlock")
	yellowManager = get_tree().current_scene.get_node("yellowManager")
	BlockImage = get_node("playerBlockSprite")
	blockPlaceTimer = get_node("BlockPlaceTimer")
	canPlaceBlock = true
func _process(delta):
	if(Input.is_action_just_pressed("Rotate")):
		rotation_degrees += 90
	if(Input.is_action_just_pressed("ui_accept") and yellowManager.gameActive == true and canPlaceBlock == true):
		canPlaceBlock = false
		blockPlaceTimer.start()
		if nextBlock == 1:
			T = T1.instantiate()
		elif nextBlock == 2:
			T = T2.instantiate()
		elif nextBlock == 3:
			T = T3.instantiate()
		elif nextBlock == 4:
			T = T4.instantiate()
		elif nextBlock == 5:
			T = T5.instantiate()
		elif nextBlock == 6:
			T = T6.instantiate()
		else:
			T = T7.instantiate()
		add_child(T)
		T.add_to_group("blocks")
		T.position = position
		T.rotation = rotation
		T.top_level = true
		yellowManager.add_turn()
		
		if rng.randf_range(1, 8) < 2:
			nextBlock = 1
			nextBlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T1.png") 
			BlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T1.png") 
			BlockImage.position.x = 0
			BlockImage.position.y = -12
		elif rng.randf_range(1, 7) < 2:
			nextBlock = 2
			nextBlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T2.png") 
			BlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T2.png") 
			BlockImage.position.x = 12
			BlockImage.position.y = 0
		elif rng.randf_range(1, 6) < 2:
			nextBlock = 3
			nextBlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T3.png") 
			BlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T3.png") 
			BlockImage.position.x = -12
			BlockImage.position.y = 0
		elif rng.randf_range(1, 5) < 2:
			nextBlock = 4
			nextBlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T4.png") 
			BlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T4.png") 
			BlockImage.position.x = 12
			BlockImage.position.y = 0
		elif rng.randf_range(1, 4) < 2:
			nextBlock = 5
			nextBlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T5.png") 
			BlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T5.png") 
			BlockImage.position.x = 12
			BlockImage.position.y = 0
		elif rng.randf_range(1, 3) < 2:
			nextBlock = 6
			nextBlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T6.png") 
			BlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T6.png") 
			BlockImage.position.x = 12
			BlockImage.position.y = 0
		else:
			nextBlock = 7
			nextBlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T7.png") 
			BlockImage.texture = load("res://Assets/Yellow/Yellow Game/T Blocks/T7.png") 
			BlockImage.position.x = 0
			BlockImage.position.y = 0

func _physics_process(delta):
	
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	if(Input.is_action_just_pressed("ui_right")):
		if position.x < 500:
			position.x += 25
	if(Input.is_action_just_pressed("ui_left")):
		if position.x > 100:
			position.x -= 25
	move_and_slide()


func _on_block_place_timer_timeout():
	canPlaceBlock = true
