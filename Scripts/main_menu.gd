extends Control

@onready var score_visual: RichTextLabel = $"Score Visual"
@onready var toggle_admin: Button = $"Toggle Admin"
@export var use_colour: Color
@export var admin_colour: Color


func _on_start_button_button_down() -> void:
	GameManager.begin_play()
	

func _on_dashboard_button_button_down() -> void:
	LevelManager.load_dashboard(GameManager.admin_mode)


func _on_exit_button_button_down() -> void:
	get_tree().quit()

func _ready() -> void:
	toggle_admin.modulate = use_colour
	
func _on_toggle_admin_button_down() -> void:
	if GameManager.toggle_admin():
		toggle_admin.modulate = admin_colour  # make button admin color
	else:
		toggle_admin.modulate = use_colour  # make button normal color
	
