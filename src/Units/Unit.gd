extends KinematicBody2D
class_name Unit

export var speed: = Vector2(300.0,300.0)
var velocity := Vector2.ZERO	
export var size = 1

func _physics_process(delta):
	velocity = move_and_slide(velocity)
