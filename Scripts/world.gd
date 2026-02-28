extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var skill_issue: RichTextLabel = $CanvasLayer/RestartButton/SkillIssue


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file(scene_file_path)


func _on_player_show_restart() -> void:
	skill_issue.hide()
	animation_player.play("restart_button")
	if RandomNumberGenerator.new().randi_range(0, 100) == 50:
		skill_issue.show()

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file(scene_file_path)
