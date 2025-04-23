extends Node2D

const userThumbHash: String = "XXXXXXDEBUGXXXXXX"

@onready var timer: Timer = $Timer
@onready var progress_bar: ProgressBar = $Button/ProgressBar

func _on_button_button_down() -> void:
	timer.start()

func _on_button_button_up() -> void:
	timer.stop()

func _on_timer_timeout() -> void:
	var loginSuccessful: bool = LoginController.authenticate_with_thumb(userThumbHash)
	if loginSuccessful:
		LevelManager.load_main_menu()
	else:
		print("Login failed")
		# TODO consider updating UI

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer.is_stopped():
		progress_bar.value = 0
	else:
		progress_bar.value = timer.wait_time - timer.time_left
