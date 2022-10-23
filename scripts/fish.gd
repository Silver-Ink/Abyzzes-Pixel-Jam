extends Area2D
enum poisson{
	bleu,
	rouge,
	lanterne
}

export(poisson) var poisson_type

# Called when the node enters the scene tree for the first time.
func _ready():
	init()


func init():
	pass#connect("area_entered", Player, "_poisson_collision", [self])
	
func _flip(mode):
	$AnimatedSprite.set_flip_h(mode)

func _process(delta):
	pass
	
func set_type(type):
	poisson_type = type
	$AnimatedSprite.play(poisson.keys()[type])
	
func get_eaten():
	Player.eat(poisson_type)
