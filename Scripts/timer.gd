extends CanvasLayer
@onready var screen_timer: RichTextLabel = $Control/ScreenTimer
@onready var credits_timer: RichTextLabel = $Control/CreditsTimer


var counting = false
var time_from_start = 0.0
var death_count = 0

# Called when the node enters the scene tree for the first time.
func add_death():
	death_count += 1

func _ready() -> void:
	screen_timer.hide()

func start_timer():
	counting = true
	death_count = 0
	time_from_start = 0
	credits_timer.hide()
	screen_timer.show()

func end_timer():
	screen_timer.hide()
	credits_timer.show()
	counting = false
	credits_timer.text = "Your time is " + str(float(round(time_from_start/6))/10) + " and you have " + str(death_count) + str(" deaths")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if counting:
		screen_timer.text = "Time: " + str(float(round(time_from_start / 6))/10) + " s\n" + "Deaths: " + str(death_count)
		time_from_start += 1
	
 
