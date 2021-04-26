extends Node

# Used to easily instance scenes at a given position
func instance_scene_on_main(scene, position):
	var main = get_tree().current_scene
	var instance = scene.instance()
	
	main.add_child(instance)
	instance.global_position = position
	
	return instance

func choose(array):
	randomize()
	array.shuffle()
	return array.front()

func get_wait_time(time):
	if time < 1:
		return [0.4,.9,1.3]
	if time < 2:
		return [0.3,.7,1.2]
	if time < 3:
		return [0.2,.5,1]
	return [0.1, .4, .8]
