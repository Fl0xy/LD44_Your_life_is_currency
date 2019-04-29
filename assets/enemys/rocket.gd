extends Sprite

export var target_global_position : Vector2 = Vector2(50, 50)
export var speed = 30.0

var heading = Vector2(0, 1)

func _physics_process(delta):
	var to_target = target_global_position - position 
	var zeug = heading.angle_to(to_target)
	
	rotation_degrees += zeug * 180/PI
	heading = heading.rotated(zeug)
	
	position += heading * delta * speed
	