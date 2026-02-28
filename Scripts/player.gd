extends CharacterBody2D

@onready var superdash_right: RayCast2D = $SuperdashRight
@onready var superdash_left: RayCast2D = $SuperdashLeft

@export var rectangle_1: Shape2D
@export var rectangle_3: Shape2D
@export var rectangle_4: Shape2D

@onready var ceiling_1: RayCast2D = $Ceiling1
@onready var ceiling_2: RayCast2D = $Ceiling2

@onready var collision: CollisionShape2D = $Collision
@onready var death_collision: CollisionShape2D = $DeathRange/DeathCollision


@onready var sprite_3: AnimatedSprite2D = $Sprite3
@onready var sprite_4: AnimatedSprite2D = $Sprite4
@onready var sprite_1: AnimatedSprite2D = $Sprite1
@onready var gas: GPUParticles2D = $Gas

var speed = 200
const JUMP_VELOCITY = -300.0
var fall_acceleration = 10
var is_left := false

var superdashing = false

var fat_level = 1

func superdash():
	gas.emitting = false
	gas.emitting = true
	superdashing = true
	fat_level = 1
	set_level(fat_level)
	velocity.y =0
	if is_left:
		velocity.x -= 1000
	else:
		velocity.x += 1000


signal show_restart

func increase_level(increase: int):
	if fat_level + increase <= 4:
		fat_level += increase
		set_level(fat_level)
		print(fat_level)

func set_level(new_level: int):
	if new_level == 1 or new_level == 2:
		collision.shape = rectangle_1
		death_collision.shape = rectangle_1
		death_collision.position.y = -5
		collision.position.y = -5
		sprite_1.show()
		sprite_3.hide()
		sprite_4.hide()
		speed = 200
	elif new_level == 3:
		collision.shape = rectangle_3
		death_collision.shape = rectangle_3
		death_collision.position.y = -10
		collision.position.y = -10
		sprite_1.hide()
		sprite_3.show()
		sprite_4.hide()
		speed = 150
	elif new_level == 4:
		death_collision.position.y = -20
		collision.position.y = -20
		death_collision.shape = rectangle_4
		collision.shape = rectangle_4
		sprite_1.hide()
		sprite_3.hide()
		sprite_4.show()
		speed = 100
		
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
		fall_acceleration = 10
		if Input.is_action_just_pressed("up"):
			velocity.y = JUMP_VELOCITY	
	else:
		velocity.y += fall_acceleration * abs(int(superdashing)-1)
		fall_acceleration += 0.3
	
	if Input.is_action_pressed("left"):
		is_left = true
		sprite_1.flip_h = true
		sprite_3.flip_h = true
		sprite_4.flip_h = true
		play_animation("run")
		if velocity.x > -speed:
			velocity.x -= 10
		elif velocity.x < -speed:
			velocity.x += 10
		else: 
			velocity.x = -speed
	elif Input.is_action_pressed("right"):
		is_left = false
		sprite_1.flip_h = false
		sprite_3.flip_h = false
		sprite_4.flip_h = false
		play_animation("run")
		if velocity.x < speed:
			velocity.x += 10
		elif velocity.x > speed:
			velocity.x -= 10
		else: 
			velocity.x = speed
	elif abs(velocity.x) > 10:
		if velocity.x < 0:
			velocity.x += 10
		else:
			velocity.x -= 10
	else:
		if ( not ceiling_1.is_colliding() and fat_level == 1 ) or ( not ceiling_1.is_colliding() and fat_level == 2 ):
			play_animation("idle")
		elif not ceiling_2.is_colliding() and fat_level == 3:
			play_animation("idle")
		velocity.x = 0	
		
	if Input.is_action_just_pressed("dash") and fat_level > 1:
		fat_level -= 1
		set_level(fat_level)
		play_animation("run")
		gas.emitting = false
		gas.emitting = true
		velocity.y = -200
		if is_left:
			velocity.x = -500
		else:
			velocity.x = 500	
		
	
	if superdashing and superdash_right.is_colliding() or superdash_left.is_colliding():
		superdashing = false
		
	move_and_slide()


func _on_death_range_body_entered(body: Node2D) -> void:
	if body.name == "Deadly":
		var gore = load("res://Scenes/gore.tscn")
		var gore_instance = gore.instantiate()
		add_child(gore_instance)
		remove_child(gore_instance)
		get_parent().add_child(gore_instance)
		gore_instance.global_position = global_position
		emit_signal("show_restart")
		hide()
		process_mode = Node.PROCESS_MODE_DISABLED
