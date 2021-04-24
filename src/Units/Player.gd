extends Unit

var stamina = Vector2(1000,1000)

func _ready():
	size = 2
	
func _physics_process(delta):
	stamina = stamina_calculator(stamina)
	var direction: = get_direction();
	velocity = (speed*stamina) * direction
	print(stamina);

func _on_EnemyDetector_body_entered(body):
	if self.size >= body.size: 
		self.increase_size()
		body.queue_free()
	else:
		die()

func get_direction() -> Vector2:
	return Vector2(
	Input.get_action_strength("move_right") -  Input.get_action_strength("move_left"),
	Input.get_action_strength("move_down") - Input.get_action_strength("move_up") 
	)

func increase_size():
	size = size +1
	self.scale *= 1.05
	
func stamina_calculator(stamina):
	var staminaBurnRate = Vector2(1,1)
	if stamina.x < 1 || stamina.y < 1:
		return Vector2(0,0)
	return (stamina - staminaBurnRate)

func die():
	get_tree().reload_current_scene()
	
