extends CanvasLayer
@onready var screen_timer: RichTextLabel = $Control/ScreenTimer

var counting = false
var time_from_start = 0.0
var tenth	 = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_timer.hide()

func start_timer():
	counting = true
	screen_timer.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tenth += delta
	if counting and tenth >= 0.1:
		screen_timer.text = "Time: " + str(time_from_start)
		time_from_start += 0.1
	
 
