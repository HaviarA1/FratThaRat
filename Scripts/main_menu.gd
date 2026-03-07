extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
"res://Scenes/level13.tscn"
@onready var sound_slider: HSlider = $Settings/CanvasLayer/Control/SoundSlider
@onready var music_slider: HSlider = $Settings/CanvasLayer/Control/MusicSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sound_slider.value = Music.sound_volume
	music_slider.value = Music.music_volume

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if music_slider.changed:
		Music.set_music_volume(music_slider.value)
	if sound_slider.changed:
		Music.set_sound_volume(sound_slider.value)

func _on_texture_button_pressed() -> void:
	animation_player.play("darken")
	await get_tree().create_timer(2).timeout
	GlobalTimer.show()
	GlobalTimer.credits_timer.hide()
	get_tree().change_scene_to_file("res://Scenes/custom_animation.tscn")


func _on_settings_pressed() -> void:
	animation_player.play("show_settings")


func _on_close_settings_pressed() -> void:
	animation_player.play("hide_settings")
