extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var gas: GPUParticles2D = $Gas

const SPEED = 50.0
const JUMP_VELOCITY = -300.0
var fall_acceleration = 0
var is_left := false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if is_on_floor():
		fall_acceleration = 0
		if Input.is_action_just_pressed("up"):
			velocity.y = JUMP_VELOCITY	
	else:
		velocity.y += fall_acceleration
		fall_acceleration += 0.1
	
	if Input.is_action_pressed("left"):
		is_left = true
		sprite_2d.flip_h = true
		sprite_2d.animation = "run"
		if velocity.x > -200:
			velocity.x -= 10
		elif velocity.x < -200:
			velocity.x += 10
		else: 
			velocity.x = -200
	elif Input.is_action_pressed("right"):
		is_left = false
		sprite_2d.flip_h = false
		sprite_2d.animation = "run"
		if velocity.x < 200:
			velocity.x += 10
		elif velocity.x > 200:
			velocity.x -= 10
		else: 
			velocity.x = 200
	elif abs(velocity.x) > 10:
		if velocity.x < 0:
			velocity.x += 10
		else:
			velocity.x -= 10
	else:
		sprite_2d.animation = "idle"
		velocity.x = 0	
		
	if Input.is_action_just_pressed("dash"):
		sprite_2d.animation = "run"
		gas.emitting = false
		gas.emitting = true
		if is_left:
			velocity.x = -500
		else:
			velocity.x = 500	
		

	move_and_slide()
