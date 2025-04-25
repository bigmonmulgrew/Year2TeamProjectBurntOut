extends Area2D

var found = false

func _ready() -> void:
	connect("input_event", Callable(self, "_on_input_event"))

func _on_input_event(viewport, event, shape_idx) -> void:
	if not (event is InputEventMouseButton and event.pressed):
		return
	if event.button_index != MOUSE_BUTTON_LEFT:
		return
	if found:
		return

	found = true
	$CollisionShape2D.disabled = true
	get_tree().get_root().get_node("FocusGame").register_click(true)
