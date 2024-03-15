extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Score: 0"

func setText(newText):
	text = newText
