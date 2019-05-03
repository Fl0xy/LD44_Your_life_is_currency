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
	$audioFire.play()
	timer.start(rocket_intervall)
	
	var instance = rocket.instance()
	
	instance.target_global_position = global.player.get_global_position() #gamejam temporäre lösung
	
	get_parent().get_parent().add_child(instance) #vor dem setzten von globalen werte in den baum setzen
	instance.set_global_position($projectile/spawn.get_global_position())
	#get_parent().get_parent().add_child(instance)

func _on_Area2D_area_entered(area):
	if area.is_in_group("blackProjectile"):
		#destroy
		get_parent().queue_free()