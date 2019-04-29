extends Node2D

export var bullet = preload("res://assets/enemys/bullet.tscn")
export var time_between_shoots = 0.0
export var time_muzzle_flash = 0.0

var time = 0
var muzzle_time = 0
var side = 0 #0=left; 1 right; active gun of the ship 
var GUN_COUNT = 2

func _physics_process(delta):
	muzzle_time += delta
	if muzzle_time > time_muzzle_flash :
		$muzzleflash/left.visible = false
		$muzzleflash/right.visible = false
		muzzle_time -= time_muzzle_flash
		
	time += delta
	if time > time_between_shoots :
		var instance = bullet.instance()
		if side == 0:
			instance.set_global_position($projectile/spawn_left.get_global_position())
			$muzzleflash/left.visible = true
			side = (side + 1) % GUN_COUNT
		else : # side == 1
			instance.set_global_position($projectile/spawn_right.get_global_position())
			$muzzleflash/right.visible = true
			side = (side + 1) % GUN_COUNT
		$sound.play()
		get_parent().get_parent().add_child(instance)
		
		time -= time_between_shoots
	
#	var x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
#	var y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
#	position += Vector2(x*5*delta, y*5*delta)
#	if Input.is_action_just_pressed("ui_accept"):
#		var instance = bullet.instance()
#		instance.set_global_position($ship_body/projectile/spawn_left.get_global_position())
#		get_parent().add_child(instance)