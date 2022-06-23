extends KinematicBody2DWithGravitation

export var speed:float = 1000

func _ready():
	pass

func _process(delta):
	
	if(Input.is_action_just_pressed("hand_kick")):
		for enemy in $AttackAreas/HandKickArea.get_overlapping_bodies():
			enemy.apply_punch(Vector2($AttackAreas.scale.x, 0), 300)
	
	var vector = Vector2(0, 0)
	if Input.is_action_pressed("left"):
		vector-= Vector2(speed*delta, 0)
	if Input.is_action_pressed("right"):
		vector+= Vector2(speed*delta, 0)
		
	if vector.x>0:
		$Sprite.animation = "Running"
		$Sprite.flip_h = 0
		$AttackAreas.scale.x = 1
	if vector.x<0:
		$Sprite.animation = "Running"
		$Sprite.flip_h = 1
		$AttackAreas.scale.x = -1
	if vector.x==0:
		$Sprite.animation = "Standing"
		
	move_and_slide(vector, Vector2.UP)
	
	if is_on_floor():
		if Input.is_action_just_released("jump"):
			gravity+=150
