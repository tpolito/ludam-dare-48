extends Unit

var stamina = Vector2(1000,1000)

onready var sounds = get_parent().get_node("Sounds")
signal die
signal ate_fish

func _ready():
	size = 2
	
func _physics_process(delta):

	self.position = stay_within_bounds(position)
	stamina = stamina_calculator(stamina)
	var direction: = get_direction();
	velocity = (speed*stamina) * direction

func _on_EnemyDetector_body_entered(body):
	if can_eat(body): 
		sounds.play_sound("Eat")
		emit_signal("ate_fish")
		var stamina_increase_rate = Vector2(200,200)
		self.increase_size()
		body.queue_free()
		stamina = stamina + stamina_increase_rate
	else:
		die()

func stay_within_bounds(position):
	var max_x = OS.window_size.x
	var max_y = OS.window_size.y
	var min_x = 0
	var min_y = 0
	
	position = Vector2(max(position.x,min_x),max(position.y,min_y))
	position = Vector2(min(position.x,max_x),min(position.y,max_y))
	
	return position

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
	
func can_eat(body):
	return self.size >= body.size

func die():
	emit_signal('die')
#	queue_free()
