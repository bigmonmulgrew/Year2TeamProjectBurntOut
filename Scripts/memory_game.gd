extends Game

@onready var correct_label = $CorrectIncorrectDisplay/UiCircleLong/Tick/Correct
@onready var incorrect_label = $CorrectIncorrectDisplay/UiCircleLong/Cross/Incorrect
@onready var red_button = $RedButtonUpBase
@onready var green_button = $GreenButtonUpBase
@onready var blue_button = $BlueButtonUpBase
@onready var yellow_button = $YellowButtonUpBase
@onready var timer = $Timer

@export var win_score: int
@export var lose_score: int

var correct_score: int = 0
var incorrect_score: int = 0

var color_buttons = {}
var color_names: Array[String] = ["red", "green", "blue", "yellow"]
var sequence: Array = []
var user_input: Array = []
var sequence_index: int = 0
var input_enabled: bool = false

func _ready() -> void:
	color_buttons = {
		"red": red_button,
		"green": green_button,
		"blue": blue_button,
		"yellow": yellow_button
	}
	
	start_new_round(3)

func start_new_round(length) -> void:
	input_enabled = false
	user_input.clear()
	sequence.clear()
	for i in range(length):
		sequence.append(color_names[randi() % color_names.size()])
	show_sequence()

func show_sequence() -> void:
	sequence_index = 0
	timer.wait_time = 1.0
