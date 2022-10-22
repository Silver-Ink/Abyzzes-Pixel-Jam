extends KinematicBody2D

const GRAVITY = 50.0
const WALK_SPEED = 200
var jump = 1
var velocity = Vector2()

func _physics_process(delta):
	
	#Les mouvements du joueur
	if Input.is_action_pressed("move-left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move-right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
	if Input.is_action_pressed("jump"):
		if jump == 1:
			velocity.y += -300
			jump = 0
	#Les animations
	if is_on_floor():
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.animation = "swim"
		$AnimatedSprite.flip_h = velocity.x < 0
	#La gravité
	if velocity.y < 80:
		velocity.y += delta * GRAVITY
	#La compilation de tout dans move_and_slide
	
	move_and_slide(velocity, Vector2(0,-1))
	
func _on_Jump_timeout():
	jump = 1
	
	
