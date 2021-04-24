extends Node2D

onready var timer = $SpawnTimer

var obstacle_array = ['trash', 'trash', 'trash']

func _on_SpawnTimer_timeout():
	timer.wait_time = Utils.choose([0.5,1,1.5])
	if obstacle_array.empty():
		populate_obstacle_array(get_parent().time)
		print('Spawning ', obstacle_array.pop_front())
	else:
#		Utils.instance_scene_on_main(trash_scene, position off screen)
		print('Spawning ', obstacle_array.pop_front())

func populate_obstacle_array(time):
	for obstacle in int(time):
		obstacle_array.push_front('new trash')
