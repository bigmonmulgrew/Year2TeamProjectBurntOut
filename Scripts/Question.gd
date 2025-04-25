extends Sprite2D

@onready var buttons: Array = [
	$StronglyDisagree,
	$Disagree,
	$NeitherAgreeOrDisagree,
	$Agree,
	$StronglyAgree
]

var selected_index: int = -1

func _ready() -> void:
	for i in range(buttons.size()):
		buttons[i].connect("pressed", Callable(self, "_on_button_pressed").bind(i))

func _on_button_pressed(index: int) -> void:
	selected_index = index
	for i in range(buttons.size()):
		buttons[i].set_pressed(i == index)
