extends Control
@onready var pause_screen: Control = $"."

var playing = false
var paused = false

func start():
	playing = true
func stop():
	playing = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playing:	
		if paused and Input.is_action_just_pressed("Pause"):
			pause_screen.hide()
			paused = false
			get_tree().paused = false
			Music.audio_stream_player.volume_db = -10
		elif not paused and Input.is_action_just_pressed("Pause"):
			pause_screen.show()
			paused = true
			Music.audio_stream_player.volume_db = -30
			get_tree().paused = true

func _on_resume_pressed() -> void:
	Music.audio_stream_player.volume_db = -10
	pause_screen.hide()
	get_tree().paused = false


func _on_menu_pressed() -> void:
	GlobalTimer.reset_timer()
	Music.audio_stream_player.volume_db = -10
	pause_screen.hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
