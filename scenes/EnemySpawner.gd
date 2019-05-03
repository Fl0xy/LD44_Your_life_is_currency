extends Node2D

export (Resource) var enemy_scene : Resource
export var direction : Vector2

func _ready():
	spawn_enemy()

func spawn_enemy():
	var node = enemy_scene.instance()
	#print(node, get_global_position())
	#node.set_global_position(get_global_position())
	node.direction = direction
	add_child(node)
	#node zuerst in baum einbinden dann erst is ein effektives setzen der globalen werte möglich
	node.set_global_position(get_global_position())