extends CharacterBody2D

@onready var ceiling_1: RayCast2D = $Ceiling1
@onready var ceiling_2: RayCast2D = $Ceiling2

@onready var level_1_collision: CollisionShape2D = $Level1Collision
@onready var level_3_collision: CollisionShape2D = $Level3Collision
@onready var level_4_collision: CollisionShape2D = $Level4Collision

@onready var sprite_3: AnimatedSprite2D = $Sprite3
@onready var sprite_4: AnimatedSprite2D = $Sprite4
@onready var sprite_1: AnimatedSprite2D = $Sprite1
@onready var gas: GPUParticles2D = $Gas

const SPEED = 50.0
const JUMP_VELOCITY = -200.0
var fall_acceleration = 0
var is_left := false

var fat_level = 1

func increase_level(increase: int):
	if fat_level + increase <= 4:
		fat_level += increase
		set_level(fat_level)

func set_level(new_level: int):
	if new_level == 1 or 2:
		level_1_collision.disabled = false
		level_3_collision.disabled = true
		level_4_collision.disabled = true
		sprite_1.show()
		sprite_3.hide()
		sprite_4.hide()
	elif new_level == 3:
		level_1_collision.disabled = true
		level_3_collision.disabled = false
		level_4_collision.disabled = true
		sprite_1.hide()
		sprite_3.show()
		sprite_4.hide()
	elif new_level >= 4:
		level_1_collision.disabled = true
		level_3_collision.disabled = true
		level_4_collision.disabled = false
		sprite_1.hide()
		sprite_3.hide()
		sprite_4.show()
		
func play_animation(new_animation: String):
	if new_animation == "idle":
		if fat_level == 1:
			sprite_1.animation = "1idle"
		elif fat_level == 2:
			sprite_1.animation = "2idle"
		sprite_3.animation = "3idle"
		sprite_4.animation = "4idle"
	elif new_animation == "run":
		if fat_level == 1:
			sprite_1.animation = "1run"
		elif fat_level == 2:
			sprite_1.animation = "2run"
		sprite_3.animation = "3run"
		sprite_4.animation = "4run"

func _ready() -> void:
	fat_level = 1
	set_level(fat_level)
	play_animation("idle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	# Handle jump.
	if is_on_floor():
		fall_acceleration = 0
		if Input.is_action_just_pressed("up"):
			velocity.y = JUMP_VELOCITY	
	else:
		velocity.y += fall_acceleration
		fall_acceleration += 0.4
	
	if Input.is_action_pressed("left"):
		is_left = true
		sprite_1.flip_h = true
		sprite_3.flip_h = true
		sprite_4.flip_h = true
		play_animation("run")
		if velocity.x > -200:
			velocity.x -= 10
		elif velocity.x < -200:
			velocity.x += 10
		else: 
			velocity.x = -200
	elif Input.is_action_pressed("right"):
		is_left = false
		sprite_1.flip_h = false
		sprite_3.flip_h = false
		sprite_4.flip_h = false
		play_animation("run")
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
		if not ceiling_1.is_colliding() and not ceiling_2.is_colliding():
			play_animation("idle")
		velocity.x = 0	
		
	if Input.is_action_just_pressed("dash") and fat_level > 1:
		fat_level -= 1
		set_level(fat_level)
		play_animation("run")
		gas.emitting = false
		gas.emitting = true
		velocity.y -= 200
		if is_left:
			velocity.x = -500
		else:
			velocity.x = 500	
		

	move_and_slide()
