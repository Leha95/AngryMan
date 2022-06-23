extends Camera2D

var norm_y = 0

func _process(delta):
	var y = min(abs(get_parent().position.y-15), 200)
	zoom.x = 0.25 + (y/1000)
	zoom.y = 0.25 + (y/1000)
	#var new_scale = (transform.y)/10
	#scale.x = new_scale
	#scale.y = new_scale
