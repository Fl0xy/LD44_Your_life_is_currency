extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const defVector: Vector2 = Vector2(0,10)

# Called when the node enters the scene tree for the first time.
func _ready():
	#$ParallaxBackground/ParallaxLayer.motion_offset = Vector2(0,1)
	#$ParallaxBackground/ParallaxLayer.motion_scale = Vector2(1,10)
	pass

func _process(delta):
	$ParallaxBackground/W1.motion_offset.y = fmod($ParallaxBackground/W1.motion_offset.y + defVector.y, 192)
	$ParallaxBackground/W2.motion_offset.y = fmod($ParallaxBackground/W2.motion_offset.y + defVector.y + 2, 192)
	$ParallaxBackground/W3.motion_offset.y = fmod($ParallaxBackground/W3.motion_offset.y + defVector.y + 5, 192)
	$ParallaxBackground/W4.motion_offset.y = fmod($ParallaxBackground/W4.motion_offset.y + defVector.y + 7, 192)
	
	$ParallaxBackground/G1.motion_offset.y = fmod($ParallaxBackground/G1.motion_offset.y + defVector.y + 9, 192)
	$ParallaxBackground/G2.motion_offset.y = fmod($ParallaxBackground/G2.motion_offset.y + defVector.y + 11, 192)
	$ParallaxBackground/G3.motion_offset.y = fmod($ParallaxBackground/G3.motion_offset.y + defVector.y + 13, 192)
