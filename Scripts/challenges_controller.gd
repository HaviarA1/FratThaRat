extends Node2D
@onready var hover_1: ColorRect = $"../Challenge1/Hover1"
@onready var hover_2: ColorRect = $"../Challenge2/Hover2"
@onready var hover_3: ColorRect = $"../Challenge3/Hover3"

@onready var label_1: Label = $"../Challenge1/Label1"
@onready var label_2: Label = $"../Challenge2/Label2"
@onready var label_3: Label = $"../Challenge3/Label3"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (round(GlobalTimer.time_from_start / 6) / 10) <= 300:
		hover_1.color = Color(255.014, 255.014, 255.014, 0.553)
		label_1.text = "UNLOCKED"
		hover_1.mouse_filter = Control.MOUSE_FILTER_PASS
	if (round(GlobalTimer.time_from_start / 6) / 10) <= 120:
		hover_2.color = Color(255.014, 255.014, 255.014, 0.553)
		label_2.text = "UNLOCKED"
		hover_2.mouse_filter = Control.MOUSE_FILTER_PASS
	if GlobalTimer.death_count <= 5:
		hover_3.color = Color(255.014, 255.014, 255.014, 0.553)
		label_3.text = "UNLOCKED"
		hover_3.mouse_filter = Control.MOUSE_FILTER_PASS
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_challenge_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level11.tscn")


func _on_challenge_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level12.tscn")


func _on_challenge_3_pressed() -> void:
	pass # Replace with function body.
