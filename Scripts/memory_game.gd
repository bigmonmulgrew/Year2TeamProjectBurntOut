extends Game

@onready var correct_label = $CorrectDisplay/UiCircle/Tick/Correct
@onready var red_button = $RedButtonUpBase
@onready var green_button = $GreenButtonUpBase
@onready var blue_button = $BlueButtonUpBase
@onready var yellow_button = $YellowButtonUpBase
@onready var timer = $Timer

@export var win_score: int
@export var lose_score: int

var correct_score: int = 2
var incorrect_score: int = 0

var color_buttons = {}
var color_names: Array[String] = ["red", "green", "blue", "yellow"]
var sequence: Array = []
var user_input: Array = []
var sequence_index: int = 0
var current_sequence_length: int = 3
var input_enabled: bool = false

func _ready() -> void:
	color_buttons = {
		"red": red_button,
		"green": green_button,
		"blue": blue_button,
		"yellow": yellow_button
	}
	
	correct_label.text = str(correct_score)
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))
	start_new_round(3)

func start_new_round(length: int) -> void:
	current_sequence_length = length
	input_enabled = false
	user_input.clear()
	sequence.clear()
	for i in range(length):
		sequence.append(color_names[randi() % color_names.size()])
	show_sequence()

func show_sequence() -> void:
	sequence_index = 0
	timer.wait_time = 1.0
	timer.start()

func _on_Timer_timeout():
	if sequence_index < sequence.size():
		var color = sequence[sequence_index]
		await flash_button(color_buttons[color])
		sequence_index += 1
		timer.start()
	else:
		input_enabled = true


func flash_button(button) -> void:
	var original_modulate = button.modulate
	button.modulate = Color(1, 1, 1)
	await get_tree().create_timer(0.3).timeout
	button.modulate = original_modulate

func _on_button_pressed(color: String) -> void:
	if not input_enabled:
		return
	user_input.append(color)
	if user_input[user_input.size() - 1] != sequence[user_input.size() - 1]:
		incorrect_score += 1
		check_game_over()
		start_new_round(current_sequence_length)
		return
	if user_input.size() == sequence.size():
		correct_score += 1
		correct_label.text = str(correct_score)
		if sequence.size() >= win_score:
			finish_memory_game(true)
		else:
			start_new_round(sequence.size() + 1)

func check_game_over():
	if incorrect_score >= lose_score:
		finish_memory_game(false)
		print("Game over!")

func finish_memory_game(won: bool):
	input_enabled = false
	#end_game() # CURRENTLY CAUSES ERROR - to be sorted in future merge
