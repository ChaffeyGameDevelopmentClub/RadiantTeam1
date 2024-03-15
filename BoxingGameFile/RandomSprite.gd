extends Sprite2D

var frames=texture.get_width()/region_rect.size.x
var keylet=""
signal change(keylet)
func _ready():
	var random_index=randi_range(0,frames-1)
	region_rect.position.x=random_index*region_rect.size.x
	if random_index==0:
		keylet="box_a"
	elif random_index==1:
		keylet="box_s"
	elif random_index==2:
		keylet="box_d"
	
	emit_signal("change",keylet)
	
	
	
	
