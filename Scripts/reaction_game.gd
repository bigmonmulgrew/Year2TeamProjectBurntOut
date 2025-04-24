extends Game

@onready var timer = $CentreCardTimer
@onready var centre_card = $CentreCard
@onready var current_card_sprite = $CurrentCard
@onready var feedback_display = $CorrectIncorrectDisplay
@onready var correct_label = $CorrectIncorrectDisplay/UiCircleLong/Tick/Correct
@onready var incorrect_label = $CorrectIncorrectDisplay/UiCircleLong/Cross/Incorrect

@export var cycle_timer: float
@export var win_score: int
@export var lose_score: int

# Card Textures (loading images)
var card_textures: Dictionary = {
	"Spade": preload("res://Images/Sprites/Spade Card.png"),
	"Diamond": preload("res://Images/Sprites/Diamond Card.png"),
	"Heart": preload("res://Images/Sprites/Heart Card.png"),
	"Club": preload("res://Images/Sprites/Club Card.png"),
}

var cards = ["Spade", "Diamond", "Heart", "Club"]

var current_card: String = ""
var centre_card_value: String = ""
var correct_score: int = 0
var incorrect_score: int = 0

func _ready() -> void:
	timer.wait_time = cycle_timer
	timer.start()
	pick_new_current_card()
	print(current_card)
	#randomize()
	
func pick_new_current_card() -> void:
	current_card = cards[randi() % cards.size()]
	current_card_sprite.texture = card_textures[current_card]

func show_random_centre_card() -> void:
	centre_card_value = cards[randi() % cards.size()]
	centre_card.texture_normal = card_textures[centre_card_value]

func _on_CentreCardButton_pressed() -> void:
	if centre_card_value == current_card:
		correct_score += 1
		correct_label.text = str(correct_score)
		if correct_score < win_score:
			pick_new_current_card()
		else:
			win_game()
	else:
		incorrect_score += 1
		incorrect_label.text = str(incorrect_score)
		if incorrect_score >= lose_score:
			# end the game, do we have a method for this already?
			pass

func _on_centre_card_timer_timeout() -> void:
	show_random_centre_card()
