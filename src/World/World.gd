extends Node2D

onready var bg = $BG
onready var pause_menu = $PauseMenu
onready var resume_button = $PauseMenu/VBoxContainer/
onready var exit_button = $PauseMenu/VBoxContainer/ExitButton
onready var game_over = $GameOver

onready var debug_menu = $Debug
onready var stamina_label = $Debug/Stamina

var time: float = 0
export var time_mult: float = .2
export var scroll_speed: float = 2
export var debug_mode: bool = false

func _ready():
	if debug_mode == true:
		debug_menu.visible = true
	$Player.connect("die", self, "_on_Player_die")

func _process(delta):
	stamina_label.text = "Stamina: " + str($Player.stamina.x)
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = true
		pause_menu.visible = true
	time += delta * time_mult
	# This scrolls the background based on the time.
	bg.rect_position.y -= scroll_speed
	
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_ResumeButton_pressed():
	pause_menu.visible = false
	get_tree().paused = false

func _on_NewGameButton_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://src/World/StartMenu.tscn")

func _on_Player_die() -> void:
	get_tree().paused = true
	game_over.visible = true
