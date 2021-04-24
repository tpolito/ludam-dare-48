extends Unit
signal eat

func _ready():
	pass

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
