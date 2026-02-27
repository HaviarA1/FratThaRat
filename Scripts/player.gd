extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -300.0
var fall_acceleration = 0


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
		if velocity.x > -200:
			velocity.x -= 10
		else: 
			velocity.x = -200
	elif Input.is_action_pressed("right"):
		if velocity.x < 200:
			velocity.x += 10
		else: 
			velocity.x = 200
	elif abs(velocity.x) > 10:
		if velocity.x < 0:
			velocity.x += 10
		else:
			velocity.x -= 10
	else:
		velocity.x = 0	
		
		

	move_and_slide()
