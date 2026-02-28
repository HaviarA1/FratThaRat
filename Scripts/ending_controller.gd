extends Node2D
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func ending():
	animation_player.play("ending")
	await get_tree().create_timer(3).timeout
	audio_stream_player.play()
	await get_tree().create_timer(3).timeout
	GlobalTimer.end_timer()
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
