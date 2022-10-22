extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _flip(mode):
	$AnimatedSprite.set_flip_h(mode)

func _process(delta):
	pass
