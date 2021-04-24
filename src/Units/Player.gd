extends Unit

func _ready():
	size = 2
	
func _physics_process(delta):
	var direction: = get_direction();
	velocity = speed * direction
	
	

func get_direction() -> Vector2:
	return Vector2(
	Input.get_action_strength("move_right") -  Input.get_action_strength("move_left"),
	Input.get_action_strength("move_down") - Input.get_action_strength("move_up") 
	)

func increase_size():
	size = size +1

func die():
	get_tree().reload_current_scene()

