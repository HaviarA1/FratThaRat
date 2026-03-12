extends Control
@onready var pause_screen: Control = $"."

var playing = false
var paused = false
var unpausable_scenes = ["res://Scenes/custom_animation.tscn", "res://Scenes/main_menu.tscn", "res://Scenes/credits.tscn"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree().get_first_node_in_group("Unpausable") != null:
		playing = false
	else:
		playing = true
		
	if playing:	
		if paused and Input.is_action_just_pressed("Pause"):
			pause_screen.hide()
			paused = false
			get_tree().paused = false
			Music.unpause()
		elif not paused and Input.is_action_just_pressed("Pause"):
			pause_screen.show()
			paused = true
			get_tree().paused = true
			Music.pause()
func _on_resume_pressed() -> void:
	Music.audio_stream_player.volume_linear *= 5
	Music.audio_stream_player_2.volume_linear *= 5
	pause_screen.hide()
	get_tree().paused = false


func _on_menu_pressed() -> void:
	GlobalTimer.reset_timer()
	Music.audio_stream_player.volume_linear *= 5
	Music.audio_stream_player_2.volume_linear *= 5
	pause_screen.hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
