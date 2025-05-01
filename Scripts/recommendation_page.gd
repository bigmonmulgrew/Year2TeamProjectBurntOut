extends Node2D

@onready var score_visual: RichTextLabel = $"Score Visual"
@onready var recommendation_text: RichTextLabel = $"Recommendation Text"



func _on_menu_button_down() -> void:
	LevelManager.load_main_menu()

func _ready() -> void:
	var score:int = GameManager.totalScore
	print("recommendation page.gd: game manager score " + str(GameManager.totalScore))
	print("recommendation page.gd: game manager score " + str(score))
	score_visual.text =  str(score) + "/50"
	
	# Pick a random piece of personal advice
	recommendation_text.text = RecommendationEngine.give_recommendation()
