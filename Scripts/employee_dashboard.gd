extends Node2D

func _on_menu_button_down() -> void:
	LevelManager.load_main_menu()

func _on_feedback_button_down() -> void:
	LevelManager.load_employee_feedback()
