extends Node2D

const Obstacle = preload("res://src/Units/Obstacle.tscn")

onready var timer = $SpawnTimer

var obstacle_array = [Obstacle]
var rng = RandomNumberGenerator.new()

func _on_SpawnTimer_timeout():
	timer.wait_time = Utils.choose([0.5,1,1.5])
	if obstacle_array.empty():
		populate_fish_array(3)
	else:
		Utils.instance_scene_on_main(obstacle_array[0], Vector2(random_x_pos(),700))
		obstacle_array.pop_front()

func populate_fish_array(time) -> void:
	for obstacle in int(time):
		obstacle_array.push_front(Obstacle)

func random_x_pos() -> int:
	rng.randomize()
	return rng.randf_range(100,900)
