extends Unit
signal eat

func _ready():
	self.size = 999

func _physics_process(delta):
	if position.y < -10:
		queue_free()
	velocity = speed * Vector2.UP

func _on_CollisionDetector_body_entered(body):
	if body.size >= self.size:
		body.increase_size()
		queue_free()
	else:
		body.die()
