extends Node2D

@onready var feedback_sliders: Array[HSlider] = [
	$"Question 1/HSlider",
	$"Question 2/HSlider",
	$"Question 3/HSlider",
	$"Question 4/HSlider",
	$"Question 5/HSlider",
]

func _on_back_button_down() -> void:
	LevelManager.load_dashboard(true)

func _on_download_button_down() -> void:
	push_error("Function not yet implemented!")


func _ready() -> void:
	var feedback_scores: Array[float] = DatabaseManager.get_feedback_history()
	
	for i in range(0, feedback_scores.size()):
		var score: float = feedback_scores[i]
		feedback_sliders[i].value = score
