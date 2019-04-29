extends Node2D

const ProjSpeed: int = 3

export var radius : float
export var rodationSpeed : float

var player
var x: float
var f1: float
var f2: float
var stepVector: Vector2

var is_fired: bool = false
var firingPosition: Vector2

func _physics_process(delta):
	if is_fired:
		visible = true
		stepVector = Vector2(0, -ProjSpeed)
		firingPosition += stepVector
		set_global_position(firingPosition)
	else:
		x += delta
		f1 = sin(rodationSpeed*x) * radius
		f2 = cos(rodationSpeed*x) * radius
		stepVector = Vector2(f1,f2)
		set_global_position(stepVector + get_parent().get_global_position())
	
func fire():
	firingPosition = get_parent().get_global_position();
	is_fired = true
	visible = false

func _on_Area2D_area_entered(area):
	if !area.is_in_group("blackProjectile"):
		player.removeProjectile(self)
		queue_free()

func set_Player(playr):
	player = playr