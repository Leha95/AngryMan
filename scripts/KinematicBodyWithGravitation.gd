class_name KinematicBody2DWithGravitation
extends KinematicBody2D

export var enable_gravity = true
export var gravity_a = 150
export var max_fall_speed = 200

var gravity: float = 0

func get_gravity(delta) -> float:
	return -gravity_a*delta

func fall(delta)-> void:
	if(enable_gravity):
		gravity += get_gravity(delta)
		gravity = max(gravity, -max_fall_speed)
		move_and_slide(Vector2(0, -gravity), Vector2.UP)
		if(is_on_floor()):
			gravity = 0

func _process(delta):
	fall(delta)
