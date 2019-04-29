extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const PROJECTILE : Resource = preload("res://scenes/blackProjectile2.tscn")
const speed : float = 1.5
const maxX : int = 113 -2
const minX : int = 2
const maxY : int = 192 -2
const minY : int = 2

var prodjectiles = []
var velocity: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	var radius: float = 4
	var speed: float = 10
	var tmpProj
	for i in range (100):
		tmpProj = PROJECTILE.instance()
		add_child(tmpProj)
		if i%2 == 0:
			radius = 4 + i * 0.1
			speed = 10 - i *0.2
		else:
			speed *= -1
		tmpProj.radius = radius
		tmpProj.rodationSpeed = speed
		prodjectiles.push_front(tmpProj)

func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_just_pressed('fire'):
		if prodjectiles.size() != 0:
			var proj = prodjectiles.pop_front()
			$AudioStreamPlayer.play()
			check_Gameover()
			proj.fire()
			remove_child(proj)
			get_parent().add_child(proj)
	velocity = velocity.normalized() * speed
	velocity = get_global_position() + velocity
	if velocity.x > minX && velocity.x < maxX && velocity.y > minY && velocity.y < maxY:
		set_global_position(velocity)
		
func check_Gameover():
	if prodjectiles.size() == 0:
		get_tree().change_scene("res://scenes/gameOver.tscn")