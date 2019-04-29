extends Control

var counter: float = 0;

func _physics_process(delta):
	counter += delta
	$RichTextLabel2.rect_scale = Vector2((2.5 + sin(counter))*0.15, (2.5 + sin(counter))*0.15)

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/main.tscn")


func _on_Button2_pressed():
	get_tree().quit()
