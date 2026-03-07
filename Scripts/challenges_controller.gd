extends Node2D
@onready var hover_1: ColorRect = $"../Challenge1/Hover1"
@onready var hover_2: ColorRect = $"../Challenge2/Hover2"
@onready var hover_3: ColorRect = $"../Challenge3/Hover3"

@onready var label_1: Label = $"../Challenge1/Label1"
@onready var label_2: Label = $"../Challenge2/Label2"
@onready var label_3: Label = $"../Challenge3/Label3"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalTimer.unlocks[0] == true:
		hover_1.color = Color(255.014, 255.014, 255.014, 0.553)
		label_1.text = "UNLOCKED"
		hover_1.mouse_filter = Control.MOUSE_FILTER_PASS
	if GlobalTimer.unlocks[1] == true:
		hover_2.color = Color(255.014, 255.014, 255.014, 0.553)
		label_2.text = "UNLOCKED"
		hover_2.mouse_filter = Control.MOUSE_FILTER_PASS
	if GlobalTimer.unlocks[2] == true:
		hover_3.color = Color(255.014, 255.014, 255.014, 0.553)
		label_3.text = "UNLOCKED"
		hover_3.mouse_filter = Control.MOUSE_FILTER_PASS


func _on_challenge_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level11.tscn")


func _on_challenge_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level12.tscn")


func _on_challenge_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level13.tscn")
