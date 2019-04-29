extends Node2D

export var speedFactor: float = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var defVectorY: float = 10.0
var w2
var w3
var w4
var g1
var g2
var g3

# Called when the node enters the scene tree for the first time.
func _ready():
	w2 = $ParallaxBackground/W2
	w3 = $ParallaxBackground/W3
	w4 = $ParallaxBackground/W4
	
	g1 = $ParallaxBackground/G1
	g2 = $ParallaxBackground/G2
	g3 = $ParallaxBackground/G3
	pass

func _process(delta):
	w2.motion_offset.y = fmod(w2.motion_offset.y + (defVectorY + 2)* speedFactor, 192)
	w3.motion_offset.y = fmod(w3.motion_offset.y + (defVectorY + 5)* speedFactor, 192)
	w4.motion_offset.y = fmod(w4.motion_offset.y + (defVectorY + 7)* speedFactor, 192)

	g1.motion_offset.y = fmod(g1.motion_offset.y + (defVectorY + 9)* speedFactor, 192)
	g2.motion_offset.y = fmod(g2.motion_offset.y + (defVectorY + 11)* speedFactor, 192)
	g3.motion_offset.y = fmod(g3.motion_offset.y + (defVectorY + 13)* speedFactor, 192)
