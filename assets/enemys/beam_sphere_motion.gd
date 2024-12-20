extends Node2D

export var target_pos : Vector2 = Vector2(50,50)
export var movement_speed = 20.0
export var direction : Vector2 #dirty hack


enum MODE {
	search,
	fire,
	flee,
	stand
}
var current_mode = MODE.search

var aplitude : float = 2.0
var frequency : float = 3.0
var time : float

func _physics_process(delta):
	target_pos = global.player.get_global_position()#gamejam
	
	#constant movement on y
	time = fmod(time + delta, (2*PI*frequency)) # (2*PI*frequency) sin() repeats
	position.y = (sin(frequency * time) * aplitude)
	
	#movement on x
	if current_mode == MODE.search :
		var movement_distance = movement_speed * delta
		var distance_to_target = abs(target_pos.x - get_global_position().x)# dumm? villeicht? abs(movement_distance - (target_pos.x - position.x))
		if distance_to_target <= movement_distance :
				movement_distance = distance_to_target
				current_mode = MODE.fire
				
		if get_global_position().x < target_pos.x :
			#movement_distance *= 1 #wouldn't do anything
			pass
		else:
			movement_distance *= -1
		
		set_global_position(Vector2(get_global_position().x + movement_distance, get_global_position().y))
	elif current_mode == MODE.fire :
		fire_beam()
	elif current_mode == MODE.stand :
		pass
	elif current_mode == MODE.flee :
		position.x += movement_speed * delta
	
func fire_beam():
	$ship_body/projectile.fire_beam()
	current_mode = MODE.stand

func _on_Area2D_area_entered(area):
	if area.is_in_group("blackProjectile"):
		#destroy
		queue_free()
