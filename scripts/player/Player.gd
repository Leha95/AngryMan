extends KinematicBody2D

export var speed:float = 1000
export var gravity_a = 90
export var max_fall_speed = 200

var vertical_force = 0.0

func _ready():
	pass

func _process(delta):
	
	var vector = Vector2(0, 0)
	if Input.is_action_pressed("left"):
		vector-= Vector2(speed*delta, 0)
	if Input.is_action_pressed("right"):
		vector+= Vector2(speed*delta, 0)
		
	if vector.x>0:
		$Sprite.animation = "Running"
		$Sprite.flip_h = 0
	if vector.x<0:
		$Sprite.animation = "Running"
		$Sprite.flip_h = 1
	if vector.x==0:
		$Sprite.animation = "Standing"
		
	vector+=Vector2(0, -vertical_force)
	move_and_slide(vector, Vector2.UP)
	
	if is_on_floor():
		if Input.is_action_just_released("jump"):
			vertical_force=100
	else:
		vertical_force-= gravity_a*delta
		vertical_force = max(vertical_force, -max_fall_speed)
