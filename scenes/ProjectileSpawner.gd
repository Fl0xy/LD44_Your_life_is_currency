extends Node2D

onready var black_projectile = preload("res://scenes/blackProjectile.tscn")

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept"):
		var bullet = black_projectile.instance()
		get_parent().add_child(bullet)
		bullet.set_global_position(get_global_position())
		bullet.direction = Vector2(-0.8, -1)
		bullet.speed = 50.0
		bullet.rotation_speed = 2.0
		bullet.frequency = 3.0
		bullet.direction = Vector2(-0.8, -1).rotated(self.rotation_degrees * (PI/180))
		bullet.speed = 60.0
		bullet.rotation_speed = 2.0
		bullet.frequency = 3.0
		
#	var x_dir = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
#	var y_dir = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
#	var rot_clock = int(Input.is_action_pressed("ui_page_down")) - int(Input.is_action_pressed("ui_page_up"))
#	position += Vector2(x_dir, y_dir) * 10 * delta
#	self.rotation_degrees += 10 * delta
