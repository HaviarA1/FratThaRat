extends Node

@onready var crump: AudioStreamPlayer = $Crump
@onready var gas_1: AudioStreamPlayer = $Gas1
@onready var gas_2: AudioStreamPlayer = $Gas2
@onready var scream: AudioStreamPlayer = $Scream

@onready var audio_stream_player_2: AudioStreamPlayer = $AudioStreamPlayer2
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var music_volume = 0.5
var sound_volume = 0.5
var paused = false
var alternative = false

func set_music_volume(new_volume):
	music_volume = new_volume
	
func pause():
	if alternative:
		audio_stream_player_2.volume_linear /= 5
		audio_stream_player.volume_linear = 0
	else:
		audio_stream_player.volume_linear /= 5
		audio_stream_player_2.volume_linear = 0
	paused = true
func unpause():
	if alternative:
		audio_stream_player_2.volume_linear *= 5
		audio_stream_player.volume_linear = 0
	else:
		audio_stream_player.volume_linear *= 5
		audio_stream_player_2.volume_linear = 0
	paused = false
	
func set_sound_volume(new_volume):
	sound_volume = new_volume
	crump.volume_linear = new_volume
	gas_1.volume_linear = new_volume
	gas_2.volume_linear = new_volume
	scream.volume_linear = new_volume


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player.play()
	audio_stream_player_2.play()
	audio_stream_player.volume_linear = music_volume
	audio_stream_player_2.volume_linear = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not paused:
		if get_tree().get_first_node_in_group("AlternativeMusic") == null:
			audio_stream_player.volume_linear = music_volume
			audio_stream_player_2.volume_linear = 0
			alternative = false
		else:
			audio_stream_player.volume_linear = 0
			audio_stream_player_2.volume_linear = music_volume / 1.5
			alternative = true
		


func _on_audio_stream_player_finished() -> void:
	audio_stream_player.play()
	audio_stream_player_2.play()
