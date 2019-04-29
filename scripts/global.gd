extends Node

var playerProjectilesCount = 0

func GameOver():
	get_tree().change_scene("res://scenes/gameOver.tscn")
	
func GameWon():
	get_tree().change_scene("res://scenes/gameWon.tscn")
	
func GameStart():
	playerProjectilesCount = 100
	get_tree().change_scene("res://scenes/main.tscn")