extends Unit

func _physics_process(delta):
	var direction: = get_direction();
	velocity = speed * direction
	
	

func get_direction() -> Vector2:
	return Vector2(
	Input.get_action_strength("move_right") -  Input.get_action_strength("move_left"),
	Input.get_action_strength("move_down") - Input.get_action_strength("move_up") 
	)
