extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var frames = []
@export var slide_time := 1.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func intro():
	for n in range(0, frames.size()):
		sprite_2d.texture = frames[n]
		animation_player.play("lighten")
		await get_tree().create_timer(3).timeout
		animation_player.play("darken")
		await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	intro()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_skip_pressed() -> void:
	animation_player.play("darken")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Scenes/level1.tscn")
