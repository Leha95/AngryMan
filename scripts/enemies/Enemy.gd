class_name BasicEnemy
extends KinematicBody2DWithGravitation

func apply_punch(direction: Vector2, power: float = 0):
	move_and_slide(direction*power, Vector2.UP)
