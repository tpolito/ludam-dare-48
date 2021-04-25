extends Node

func play_ambient(sound):
	if self.has_node(sound):
		if self.get_node(sound).playing == false:
			self.get_node(sound).play()

func play_sound(sound):
	print("played ",sound)
	if self.has_node(sound):
		self.get_node(sound).play()
		
func stop(sound):
	print("stopped", sound)
	if self.get_node(sound).playing == true:
		self.get_node(sound).stop();
