extends Node2D

onready var bg = $BG

var time: float = 0
export var time_mult: float = .2
export var scroll_speed: float = 2

func _ready():
	pass

func _process(delta):
	time += delta * time_mult
	print(time)
	# This scrolls the background based on the time.
	bg.rect_position.y -= scroll_speed
