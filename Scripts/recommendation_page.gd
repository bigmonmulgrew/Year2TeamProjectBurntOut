extends Node2D

@onready var score_visual: RichTextLabel = $"Score Visual"
@onready var recommendation_text: RichTextLabel = $"Recommendation Text"

const STANDARD_ADVICE = "Try resting more, your workplace is over working you."
const PERSONAL_ADVICE = [
	"Take a 5-minute walk to refresh your mind.",
	"Drink some water and stretch a little.",
	"Close your eyes for a minute and breathe deeply.",
	"Try to organize your tasks and take small breaks.",
	"Listen to some calm music to relax your brain."
]

func _on_menu_button_down() -> void:
	LevelManager.load_main_menu()

func _ready() -> void:
	var score:int = GameManager.totalScore
	score_visual.text =  str(score) + "/50"
	
	# Pick a random piece of personal advice
	var random_advice = PERSONAL_ADVICE[randi() % PERSONAL_ADVICE.size()]
	recommendation_text.text = random_advice + "\n" + STANDARD_ADVICE
