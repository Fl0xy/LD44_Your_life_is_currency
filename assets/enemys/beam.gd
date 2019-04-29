extends Node2D

var timer : Timer

func _ready():
	$beam.visible = false
	$beam.set_physics_process(false)
	
	$laser_cast.visible = false
	

func set_timer(wait_time : float, function_name):
	timer = Timer.new()
	timer.connect("timeout", self, function_name)
	add_child(timer)
	timer.start(wait_time)
	
func fire_beam():
	set_timer(0.01, "laser_cast")

func laser_cast():
	timer.queue_free()
	
	$laser_cast.visible = true
	
	set_timer(2, "full_beam")

func full_beam():
	timer.queue_free()
	
	$laser_cast.visible = false
	
	$beam.visible = true
	set_physics_process(true)
	
	set_timer(1, "no_beam")

func no_beam():
	timer.queue_free()
	
	visible = false
	set_physics_process(false)
	
	var beam_sphere = get_parent().get_parent()
	beam_sphere.current_mode = beam_sphere.MODE.flee