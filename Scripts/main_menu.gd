extends Control

@onready var score_visual: RichTextLabel = $"Score Visual"



func _on_start_button_button_down() -> void:
	GameManager.begin_play()


func _on_dashboard_button_button_down() -> void:
	LevelManager.load_dashboard()


func _on_exit_button_button_down() -> void:
	get_tree().quit()
