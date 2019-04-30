extends Node2D

var timer : Timer

func _ready():
	$beam.visible = false
	physics(false)
	$laser_cast.visible = false
	
func physics(input : bool):
	$beam/beam_chunk/Area2D/CollisionShape2D.disabled = input
	$beam/beam_chunk2/Area2D/CollisionShape2D.disabled = input
	$beam/beam_chunk3/Area2D/CollisionShape2D.disabled = input
	$beam/beam_chunk4/Area2D/CollisionShape2D.disabled = input
	$beam/beam_chunk5/Area2D/CollisionShape2D.disabled = input
	$beam/beam_chunk6/Area2D/CollisionShape2D.disabled = input
	$beam/beam_chunk7/Area2D/CollisionShape2D.disabled = input
	$beam/beam_chunk8/Area2D/CollisionShape2D.disabled = input


func set_timer(wait_time : float, function_name):
	timer = Timer.new()
	timer.connect("timeout", self, function_name)
	add_child(timer)
	timer.start(wait_time)
	
func fire_beam():
	set_timer(0.01, "laser_cast")

func laser_cast():
	$audioLaserCast.play()
	timer.queue_free()
	
	$laser_cast.visible = true
	
	set_timer(2, "full_beam")

func full_beam():
	$audioLaserBeam.play()
	timer.queue_free()
	
	$laser_cast.visible = false
	
	$beam.visible = true
	physics(true)
	
	set_timer(2, "no_beam")

func no_beam():
	timer.queue_free()
	
	visible = false
	physics(false)
	
	var beam_sphere = get_parent().get_parent()
	beam_sphere.current_mode = beam_sphere.MODE.flee