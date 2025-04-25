extends Game

@export_category("Score Weighting")
@export var CORRECT_SCORE: int = 10
@export var SORT_OF_CORRECT_SCORE: int = 6
@export var SORT_OF_INCORRECT_SCORE: int = 3
@export var INCORRECT_SCORE: int = 0
@export var TIMER_SCORE: int = 0

@onready var question: RichTextLabel = $Question
@onready var answer_1: Button = $"Answer 1"
@onready var answer_2: Button = $"Answer 2"
@onready var answer_3: Button = $"Answer 3"
@onready var answer_4: Button = $"Answer 4"

@export var questions = [
	["What is the capital of Canada?", "Ottawa", "Torronto", "Montreal", "Vancouver"]
]

var current_answer_scores: Array[int] = []
var answer_buttons: Array[Button] = []

func _ready() -> void:
	answer_buttons = [answer_1, answer_2, answer_3, answer_4]

	# Disconnect any previous connections (just to be safe)
	for btn in answer_buttons:
		if btn.pressed.is_connected(_on_answer_pressed):
			btn.pressed.disconnect(_on_answer_pressed)

	# Connect all buttons to the handler with index bound
	for i in range(answer_buttons.size()):
		answer_buttons[i].pressed.connect(_on_answer_pressed.bind(i))

	assign_random_answers(0)

func assign_random_answers(question_index: int):
	var current_question = questions[question_index]
	var all_answers = current_question.slice(1, 5)
	var base_scores = [
		CORRECT_SCORE,
		SORT_OF_CORRECT_SCORE,
		SORT_OF_INCORRECT_SCORE,
		INCORRECT_SCORE
	]

	# Pair each answer with its corresponding score
	var paired: Array = []
	for i in range(4):
		paired.append([all_answers[i], base_scores[i]])

	paired.shuffle()

	# Assign shuffled answers and scores to buttons
	current_answer_scores.clear()
	for i in range(4):
		answer_buttons[i].text = paired[i][0]
		current_answer_scores.append(paired[i][1])

	# Set the question text
	question.text = current_question[0]

func _on_answer_pressed(button_index: int) -> void:
	userScore = current_answer_scores[button_index]
	var selected_text = answer_buttons[button_index].text
	win_game()
