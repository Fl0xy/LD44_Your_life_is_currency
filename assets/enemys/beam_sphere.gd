extends Node2D

func _ready():
	$projectile.visible = false
	$projectile.set_physics_process(false)