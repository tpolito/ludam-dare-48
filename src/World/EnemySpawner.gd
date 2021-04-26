extends Node2D

const Enemy = preload("res://src/Units/Enemy.tscn")

onready var timer = $SpawnTimer

var fish_array = [Enemy, Enemy, Enemy]
var rng = RandomNumberGenerator.new()

var fish_spawned = 0

func _on_SpawnTimer_timeout():
	timer.wait_time = Utils.choose(Utils.get_wait_time(get_parent().time))
	if fish_array.empty():
		populate_fish_array(get_parent().time * 10)
	else:
		Utils.instance_scene_on_main(fish_array[0], Vector2(random_x_pos(),700))
		fish_array.pop_front()

func populate_fish_array(time) -> void:
	for fish in int(time):
		fish_array.push_front(Enemy)

func random_x_pos() -> int:
	rng.randomize()
	return rng.randf_range(50,1000)


