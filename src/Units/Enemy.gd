extends Unit
signal eat

var blue_fish = preload("res://assets/enemy_sprites/blue_fish.tres")
var red_fish = preload("res://assets/enemy_sprites/red_fish.tres")
var purple_fish = preload("res://assets/enemy_sprites/purple_fish.tres")
var puffer_fish = preload("res://assets/enemy_sprites/puffer_fish.tres")

onready var sprite = $enemy

func _ready():
	random_sprite()

func _physics_process(delta):
	velocity = speed * Vector2.UP

func _on_CollisionDetector_body_entered(body):
	if body.size >= self.size:
		body.increase_size()
		queue_free()
	else:
		body.die()

func random_sprite() -> void:
	var random_fish_texture = Utils.choose([blue_fish, purple_fish, red_fish, puffer_fish])
	sprite.texture = random_fish_texture
