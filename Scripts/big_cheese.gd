extends StaticBody2D
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_collect_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var cheese = load("res://Scenes/big_cheese_debris.tscn")
		var instantiate = cheese.instantiate()
		get_parent().add_child(instantiate)
		instantiate.position = global_position
		queue_free()
