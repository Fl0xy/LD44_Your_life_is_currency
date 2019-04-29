extends Node2D

export var rocket_intervall : float = 5

var timer : Timer
var rocket = preload("res://assets/enemys/rocket.tscn")

func _ready():
	timer = Timer.new()
	timer.connect("timeout", self, "fire_rocket")
	add_child(timer)
	timer.start(rocket_intervall)

func fire_rocket():
	timer.start(rocket_intervall)
	
	var instance = rocket.instance()
	instance.set_global_position($projectile/spawn.get_global_position())
	get_parent().get_parent().add_child(instance)