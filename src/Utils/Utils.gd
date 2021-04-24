extends Node

# Used to easily instance scenes at a given position
func instance_scene_on_main(scene, position):
	var main = get_tree().current_scene
	var instance = scene.instance()
	
	main.add_child(instance)
	instance.global_position = position
	
	return instance

func choose(array):
	array.shuffle()
	return array.front()
