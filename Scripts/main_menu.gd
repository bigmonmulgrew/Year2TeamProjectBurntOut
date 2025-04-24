extends Control

@onready var score_visual: RichTextLabel = $"Score Visual"



func _on_start_button_button_down() -> void:
	GameManager.begin_play()


func _on_dashboard_button_button_down() -> void:
	push_error("Dashboard not yet implemented!")


func _on_exit_button_button_down() -> void:
	get_tree().quit()
