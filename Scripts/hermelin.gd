extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
	




func _on_collect_body_entered(body: Node2D) -> void:

	if body.name == "Player":
		body.superdash()
		var cheese = load("res://Scenes/cheese_debris.tscn")
		var instantiate = cheese.instantiate()
		get_parent().add_child(instantiate)
		instantiate.position = global_position
		queue_free()
