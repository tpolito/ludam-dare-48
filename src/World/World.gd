extends Node2D

onready var bg = $BG
onready var pause_menu = $PauseMenu
onready var resume_button = $PauseMenu/VBoxContainer/
onready var exit_button = $PauseMenu/VBoxContainer/ExitButton

var time: float = 0
export var time_mult: float = .2
export var scroll_speed: float = 2

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = true
		pause_menu.visible = true
	time += delta * time_mult
	# This scrolls the background based on the time.
	bg.rect_position.y -= scroll_speed

func _on_ExitButton_pressed():
	get_tree().quit()


func _on_ResumeButton_pressed():
	pause_menu.visible = false
	get_tree().paused = false
	
