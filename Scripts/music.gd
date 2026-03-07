extends Node
@onready var crump: AudioStreamPlayer = $Crump
@onready var gas_1: AudioStreamPlayer = $Gas1
@onready var gas_2: AudioStreamPlayer = $Gas2
@onready var scream: AudioStreamPlayer = $Scream

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var music_volume = 0.5
var sound_volume = 0.5

func set_music_volume(new_volume):
	music_volume = new_volume
	audio_stream_player.volume_linear = new_volume


func set_sound_volume(new_volume):
	sound_volume = new_volume
	crump.volume_linear = new_volume
	gas_1.volume_linear = new_volume
	gas_2.volume_linear = new_volume
	scream.volume_linear = new_volume


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_audio_stream_player_finished() -> void:
	audio_stream_player.play()
