extends Node2D

@onready var questions: Array = [
	$Question1,
	$Question2,
	$Question3,
	$Question4,
	$Question5
]

func _on_back_button_down() -> void:
	LevelManager.load_dashboard()

func _on_submit_button_down() -> void:
	var answers: Array[int] = []
	for question in questions:
		var selected: int = question.selected_index
		if selected == -1:
			push_error("Please answer all questions before submitting.")
			return
		answers.append(selected)
	
	DatabaseManager.userFeedback = answers
	print("Submitted feedback: ", answers)
