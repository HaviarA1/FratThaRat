extends AnimatedSprite2D
@onready var ashes: GPUParticles2D = $Ashes


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var randi = RandomNumberGenerator.new().randi_range(1, 200)
	if randi == 100:
		ashes.emitting = true
