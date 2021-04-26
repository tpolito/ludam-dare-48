extends Node2D

onready var bg = $BG
onready var pause_menu = $PauseMenu
onready var resume_button = $PauseMenu/VBoxContainer/
onready var exit_button = $PauseMenu/VBoxContainer/ExitButton
onready var game_over = $GameOver

onready var debug_menu = $Debug
onready var stamina_label = $Debug/Stamina
onready var score_label = $Debug/Score
onready var game_over_label = $GameOver/VBoxContainer/GameOver
onready var game_over_score_label = $GameOver/VBoxContainer/Score

onready var sounds = $Sounds

var time: float = 0
export var time_mult: float = .2
export var scroll_speed: float = 2
export var debug_mode: bool = false

var score = 0

func _ready():
	if debug_mode == true:
		debug_menu.visible = true
	$Player.connect("die", self, "_on_Player_die")
	$Player.connect("ate_fish", self, "_on_Player_eat_fish")

func _process(delta):
	stamina_label.text = "Stamina: " + str($Player.stamina.x)
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = true
		pause_menu.visible = true
	time += delta * time_mult
	# This scrolls the background based on the time.
	bg.rect_position.y -= scroll_speed
	sounds.play_ambient("Ambient")
	if time > 5.3:
		win()

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
	sounds.play_sound("Die")
	sounds.stop("Ambient")
	game_over_score_label.text = "You ate " + str(score) + " fishes."

func _on_Player_eat_fish() -> void:
	print('score go up')
	score += 1
	score_label.text = "Score: " + str(score)

func win() -> void:
	get_tree().paused = true
	game_over.visible = true
	sounds.stop("Ambient")
	game_over_label.text = "You win!"
	game_over_score_label.text = "You ate " + str(score) + " fishes."
