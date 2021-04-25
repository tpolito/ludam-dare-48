extends Node2D

onready var start_button = $Control/VBoxContainer/StartButton
onready var exit_button = $Control/VBoxContainer/ExitButton

func _on_StartButton_pressed():
	get_tree().change_scene("res://src/World/World.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
