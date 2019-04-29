extends Node2D

export var direction : Vector2
export var speed : float
export var rotation_speed : float

export var aplitude : float = 0.0
export var phase : float = 0.0
export var frequency : float = 1.0
export var vertical_shift : float = 0.0
var time : float

var sum_rot = 0

func _physics_process(delta):
	time = fmod(time + delta, (2*PI*frequency)) # (2*PI*frequency) sin() repeats
	var tmp_rotation_speed = rotation_speed * (sin(frequency * (time + phase)) * aplitude + vertical_shift)
	sum_rot += tmp_rotation_speed * delta
	var norm_dir = direction.normalized().rotated(sum_rot)
	set_global_position(get_global_position() + norm_dir * delta * speed)