extends Node2D

func _on_menu_button_down() -> void:
	LevelManager.load_main_menu()

func _on_feedback_button_down() -> void:
	LevelManager.load_manager_view_feedback()

func _on_view_fatigue_button_down() -> void:
	LevelManager.load_manager_view_fatigue()
