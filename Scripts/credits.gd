extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_restart_button_pressed() -> void:
	animation_player.play("darken")
	await get_tree().create_timer(2).timeout
	Music.audio_stream_player_2.volume_linear = 0
	GlobalTimer.hide()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
