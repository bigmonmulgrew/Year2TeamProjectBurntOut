extends Node2D

@onready var score_ui: Array[RichTextLabel] = [
	$"Score 0",
	$"Score 1",
	$"Score 2",
	$"Score 3",
	$"Score 4",
	$"Score 5",
	$"Score 6"
]


func _on_menu_button_down() -> void:
	LevelManager.load_main_menu()

func _on_feedback_button_down() -> void:
	LevelManager.load_manager_view_feedback()

func _on_view_fatigue_button_down() -> void:
	LevelManager.load_manager_view_fatigue()

func _ready() -> void:
	var fatigue_scores: Array[int] = DatabaseManager.get_fatigue_history()
	
	for i in range(0, fatigue_scores.size()):
		var score: int = fatigue_scores[i]
		score_ui[i].text = str(score)
