extends Sprite

var fadeout: bool = false
var fade: float = 1

func spawn_enemy():
	pass #somewhere the game is calling this, so it has to be here. nt shure why though

func _process(delta):
	if fadeout:
		fade -= delta * 2
		
		if fade < 0:
			fade = 0
			fadeout = false
			queue_free()
		
		modulate = Color(1,1,1,fade)

func _on_Timer_timeout():
	fadeout = true;
	$Area2D/CollisionShape2D.disabled = true
	queue_free()
