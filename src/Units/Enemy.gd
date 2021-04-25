extends Unit
signal eat

var blue_fish = preload("res://assets/enemy_sprites/blue_fish.tres")
var red_fish = preload("res://assets/enemy_sprites/red_fish.tres")
var purple_fish = preload("res://assets/enemy_sprites/purple_fish.tres")
var puffer_fish = preload("res://assets/enemy_sprites/puffer_fish.tres")

onready var sprite = $enemy
onready var player = get_parent().get_node("Player")
onready var movement_pattern : String
var movement_patterns = ["UP","TOWARDS_AWAY_PLAYER"]
var rng = RandomNumberGenerator.new()


func _ready():
	random_sprite()
	movement_pattern = movement_patterns[randi() % movement_patterns.size()]
	speed = rng.randi_range(1,2) * speed

func _physics_process(delta):
	remove_on_exit()
	if player:
		look_at(player.position)
		velocity = calculate_velocity(movement_pattern)
	else:
		velocity = Vector2.UP * speed

func remove_on_exit():
	if position.y < -10:
		queue_free()

func move_up():
	return speed * Vector2.UP
	
func move_towards_away_player():
	var new_velocity = Vector2.ZERO
	new_velocity = self.position.direction_to(player.position) * 300
	new_velocity.x = sin(get_parent().time*20) * new_velocity.x 
	return new_velocity
	
func calculate_velocity(movement_pattern):
	if movement_pattern == "UP":
		return move_up()
	if movement_pattern == "TOWARDS_AWAY_PLAYER":
		return move_towards_away_player()
		
	return move_up()

func random_sprite() -> void:
	var random_fish_texture = Utils.choose([blue_fish, purple_fish, red_fish, puffer_fish])
	sprite.texture = random_fish_texture
