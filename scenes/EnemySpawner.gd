extends Node2D

export (Resource) var enemy_scene : Resource
export var direction : Vector2

func _ready():
	spawn_enemy()
	pass

func spawn_enemy():
	var node = enemy_scene.instance()
	#print(node, get_global_position())
	#node.set_global_position(get_global_position())
	node.direction = direction
	add_child(node)# weird wenn get_parent().add_child() dann wird die ready function nicht ausgeführt?
	#node zuerst in baum einbinden dann erst is ein effektives setzen der globalen werte möglich
	node.set_global_position(get_global_position())