extends KinematicBody2D
signal hit
const GRAVITY = 200.0
var velocity = Vector2()
export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func get_input(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move-right"):
		velocity.x += 1
	if Input.is_action_pressed("move-left"):
		velocity.x += -1

	if velocity.length() > 0:
		velocity = velocity.normalized()*speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity*delta
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deffered("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _physics_process(delta):
	get_input(delta)
	move_and_collide(velocity*delta)


