extends Game

@export_category("Score Weighting")
var taps: int = 0
var total_differences: int = 7
var differences_found: int = 0
var incorrect_guesses: int = 0
var BASE_SCORE: int = 3
var TIMEOUT_SCORE: int = -5

@onready var correct: RichTextLabel = $CorrectDisplay/UiCircle/Tick/Correct


func _ready() -> void:
	correct.text = str(differences_found) + "/" + str(total_differences)
	userScore = BASE_SCORE

func register_click(is_correct: bool) -> void:
	if is_correct:
		differences_found += 1
	else:
		taps += 1
	incorrect_guesses = taps - differences_found
	correct.text = str(differences_found) + "/" + str(total_differences)
	print("Click registered. Total:", taps, " Correct:", differences_found, "incorrect:", incorrect_guesses)
	print("Score:", clamp((BASE_SCORE + differences_found - floor(incorrect_guesses / 3)),0,10))
	if differences_found >= total_differences:
		userScore = clamp((BASE_SCORE + differences_found - floor(incorrect_guesses / 3)),0,10)
		end_game()


func _on_game_timer_timeout() -> void:
	userScore = clamp(userScore + TIMEOUT_SCORE,0,10)
	end_game()
