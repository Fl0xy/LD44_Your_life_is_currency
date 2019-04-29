extends Sprite

export var target_global_position : Vector2 = Vector2(50, 50)
export var speed = 30.0
export var turning_speed = 1.0

var heading = Vector2(0, 1)

func _physics_process(delta):
	var to_target = target_global_position - position 
	
	var tmp_turning_speed = turning_speed * delta
	var turn_by = heading.angle_to(to_target) #distance to turn
	print(turn_by)
	if turn_by > tmp_turning_speed :
		turn_by = tmp_turning_speed
	elif turn_by < -tmp_turning_speed :
		turn_by = -tmp_turning_speed
	
	rotation_degrees += turn_by * 180/PI
	heading = heading.rotated(turn_by)
	
	position += heading * delta * speed
	