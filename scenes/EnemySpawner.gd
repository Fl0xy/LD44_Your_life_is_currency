extends Node2D

export (Resource) var enemy_scene : Resource

func _ready():#spawn_enemy():
	var node = enemy_scene.instance()
	node.set_global_position(get_global_position())
	add_child(node)