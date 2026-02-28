extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file(scene_file_path)


func _on_player_show_restart() -> void:
	animation_player.play("restart_button")

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file(scene_file_path)
