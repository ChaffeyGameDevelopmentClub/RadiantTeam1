extends Area2D
var demolition
var yellowManager
var score
var combo

# Called when the node enters the scene tree for the first time.
func _ready():
	demolition = 0
	yellowManager = get_tree().current_scene.get_node("yellowManager")
	combo = 1
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if demolition:
		position.x -= 3
	if position.x < -1000:
		demolition = 0
		position.x = 360
		combo = 1
		yellowManager.demolition_over()


func _on_body_entered(body):
	if body.is_in_group("blocks"):
		body.queue_free()
		combo += 1
		if combo > 10:
			combo += 1
		yellowManager.add_score(combo)

func demolition_time():
	demolition = 1
	
