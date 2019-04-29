extends Node2D

var timer : Timer

func _ready():
	visible = false
	set_physics_process(false)

func set_timer(wait_time : float, function_name):
	timer = Timer.new()
	timer.connect("timeout", self, "full_beam")
	add_child(timer)
	timer.start(0.01)
	
func fire_beam():
	set_timer(0.01, "full_beam")
	
func full_beam():
	visible = true
	set_physics_process(true)