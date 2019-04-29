extends Node2D

var player

func _ready():
	$textProjCount.text = str(global.playerProjectilesCount)
