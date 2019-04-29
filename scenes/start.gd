extends Control

var counter: float = 0;
var scaleHuman: int = 1;
var scaleLogic: float = 1;
var root
var initalSize: Vector2

func _ready():
	$scaleDisplay.text = str(scaleHuman)
	root = get_tree().get_root()
	initalSize = root.get_size()
	print(initalSize)

func _physics_process(delta):
	counter += delta
	$RichTextLabel2.rect_scale = Vector2((2.5 + sin(counter))*0.15, (2.5 + sin(counter))*0.15)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/main.tscn")


func _on_Button2_pressed():
	get_tree().quit()


#func _on_Button_pressed():
#	scale += 0.25
	#if scale > 2.5:
	#	scale = 1
	#$btnScale.text = "Scale: " + str(scale)
	#print(initalSize * scale) 
	#OS.set_window_size(initalSize * scale)
	#root.set_size(initalSize * scale)


func _on_SP_pressed():
	scaleHuman += 1
	scaleLogic += 0.25
	if scaleHuman > 5:
		scaleHuman = 1
		scaleLogic = 1
	resizeScreen()


func _on_SM_pressed():
	scaleHuman -= 1
	scaleLogic -= 0.25
	if scaleHuman < 1:
		scaleHuman = 5
		scaleLogic = 2
	resizeScreen()

func resizeScreen():
	$scaleDisplay.text = str(scaleHuman)
	print("Human: ", scaleHuman, " | Logic: ", scaleLogic)
	OS.set_window_size(initalSize * scaleLogic)