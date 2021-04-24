extends Node2D

onready var timer = $SpawnTimer

var fish_array = ['fish1', 'fish2', 'fish3']

func _on_SpawnTimer_timeout():
	timer.wait_time = Utils.choose([0.5,1,1.5])
	if fish_array.empty():
		populate_fish_array(get_parent().time)
		print('Spawning ', fish_array.pop_front())
	else:
#		Utils.instance_scene_on_main(fish_scene, position off screen)
		print('Spawning ', fish_array.pop_front())

func populate_fish_array(time):
	for fish in int(time):
		fish_array.push_front('new fish')
