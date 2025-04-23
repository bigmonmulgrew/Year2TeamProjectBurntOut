extends Timer

var time_remaining := 120 #Default time for minigames
@onready var time_text: RichTextLabel = $TimeText

func _ready():
	update_Game_Timer()
	$Timer.start() #Start Timer
	
func _on_Timer_timeout():
	if time_remaining > 0:
		time_remaining -= 1
		update_Game_Timer()
	else:
		$Timer.stop()
		time_text.clear()
		time_text.add_text("0:00")
		print_debug("Time Up")
	
func update_Game_Timer():
	var minutes = time_remaining / 60
	var seconds = time_remaining % 60
	time_text.clear()
	time_text.add_text("%02d:%02d" % [minutes, seconds])
