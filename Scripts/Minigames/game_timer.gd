extends Timer
signal timer_finished

@export var time_duration : int = 120 # Time for minigames
var time_remaining : int
@onready var time_text: RichTextLabel = $TimeText

func _ready() -> void:
	time_remaining = time_duration
	update_Game_Timer()
	start() #Start Timer
	
func update_Game_Timer() -> void:
	var minutes : float = time_remaining / 60
	var seconds : float = time_remaining % 60
	time_text.clear()
	time_text.add_text("%02d:%02d" % [minutes, seconds])

func _on_timeout() -> void:
	if time_remaining > 0:
		time_remaining -= 1
		update_Game_Timer()
	else:
		stop()
		time_text.clear()
		time_text.add_text("00:00")
		print_debug("Time Up")
		_on_time_end()
		
func _on_time_end() -> void:
	emit_signal("timer_finished")
