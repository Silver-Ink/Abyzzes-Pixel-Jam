extends KinematicBody2D

var enduranceMAX = 200
var endurance = enduranceMAX

const GRAVITY = 30
const WALK_SPEED = 200
const JUMP_FORCE = 500
const MAX_GRAVITY = 100
const FRICTION = .90
var jump = 1
var velocity = Vector2()
var gravity = Vector2()
var dash_charge = 0
var dash_charging = false

func _poisson_collision(area):
	print("ok")
	
func dash(charge):
	var mousePos = get_global_mouse_position()
	var angle = atan2(mousePos.y - position.y, mousePos.x - position.x) 
	var dash = Vector2(cos(angle), sin(angle)) * charge
	velocity += dash
	
	
func _physics_process(delta):
	
	#Les mouvements du joueur
	if Input.is_action_pressed("move-left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move-right"):
		velocity.x =  WALK_SPEED
	velocity.x *= FRICTION
	
	if Input.is_action_pressed("jump"):
		if jump == 1:
			velocity.y += -JUMP_FORCE
			jump = 0
			$Jump.start()
			
	if Input.is_action_just_pressed("dash"):
		dash_charging = true
	
	if Input.is_action_just_released("dash"):
		dash_charging = false
		dash(1000)
	#Les animations
	if is_on_floor():
		$AnimatedSprite.animation = "walk"

	else:
		$AnimatedSprite.animation = "swim"
	if velocity.x != 0:	
		$AnimatedSprite.flip_h = velocity.x < 0
	#La gravité
	if (!is_on_floor()):
		velocity.y += GRAVITY
	if (velocity.y > MAX_GRAVITY):
		velocity.y = MAX_GRAVITY
	
	#La compilation de tout dans move_and_slide
	
	move_and_slide(velocity, Vector2(0,-1))
	
func _on_Jump_timeout():
	jump = 1
	
