extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Button2_pressed():
	#get_tree().change_scene("res://scenes/main.tscn")
	global.GameStart()

func _on_Button_pressed():
	get_tree().quit()
