extends Node2D



func _on_timer_timeout() -> void:
	LevelManager.load_main_menu()
