extends Area2D

func _ready() -> void:
	input_event.connect(_on_input_event)

func _on_input_event(viewport, event, shape_idx) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().get_root().get_node("FocusGame").register_click(false)
