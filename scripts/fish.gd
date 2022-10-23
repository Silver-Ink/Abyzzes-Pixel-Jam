extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	init()


func init():
	pass#connect("area_entered", Player, "_poisson_collision", [self])
	
func _flip(mode):
	$AnimatedSprite.set_flip_h(mode)

func _process(delta):
	pass
	


