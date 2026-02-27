extends CharacterBody2D
@onready var spring_player: RigidBody2D = $SpringPlayer

@onready var fat_6: RigidBody2D = $Fat6
@onready var fat_5: RigidBody2D = $Fat5
@onready var fat_4: RigidBody2D = $Fat4
@onready var fat_3: RigidBody2D = $Fat3
@onready var fat_2: RigidBody2D = $Fat2
@onready var fat_1: RigidBody2D = $Fat

@export var body_color: Color


func _draw() -> void:
	draw_colored_polygon([fat_1.global_position, fat_2.global_position, fat_3.global_position, fat_4.global_position, fat_5.global_position, fat_6.global_position], body_color)
func _physics_process(delta: float) -> void:
	
	global_position = spring_player.position
	
