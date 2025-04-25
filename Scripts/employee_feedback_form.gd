extends Node2D

func _on_back_button_down() -> void:
	LevelManager.load_dashboard()

func _on_submit_button_down() -> void:
	push_error("Function not yet implemented!")
