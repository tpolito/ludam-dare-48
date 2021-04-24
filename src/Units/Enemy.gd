extends Unit
signal eat

func _ready():
	pass

func _on_CollisionDetector_body_entered(body):
	print(size)
	if body.size >= self.size:
		body.increase_size()
		queue_free()
	else:
		body.die()
