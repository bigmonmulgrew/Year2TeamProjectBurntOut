extends Game

@onready var timer = $CentreCardTimer
@onready var centre_card = $CentreCard
@onready var current_card_sprite = $CurrentCard
@onready var feedback_display = $CorrectIncorrectDisplay
@onready var correct_label = $CorrectIncorrectDisplay/UiCircleLong/Tick/Correct
@onready var incorrect_label = $CorrectIncorrectDisplay/UiCircleLong/Cross/Incorrect

# Card Textures (loading images)
var card_textures = {
	"Spade": preload("res://Images/Sprites/Spade Card.png"),
	"Diamond": preload("res://Images/Sprites/Diamond Card.png"),
	"Heart": preload("res://Images/Sprites/Heart Card.png"),
	"Club": preload("res://Images/Sprites/Club Card.png"),
}

var cards = ["Spade", "Diamond", "Heart", "Club"]

var current_card = ""
var centre_card_value = ""
var correct_score = 0
var incorrect_score = 0

func _ready():
	timer.wait_time = 1.0
	timer.start()
	pick_new_current_card()
	print(current_card)
	#randomize()
	
func pick_new_current_card():
	current_card = cards[randi() % cards.size()]
	current_card_sprite.texture = card_textures[current_card]

func show_random_centre_card():
	centre_card_value = cards[randi() % cards.size()]
	centre_card.texture_normal = card_textures[centre_card_value]

func _on_CentreCardButton_pressed() -> void:
	if centre_card_value == current_card:
		correct_score += 1
		correct_label.text = str(correct_score)
		pick_new_current_card()
	else:
		incorrect_score += 1
		incorrect_label.text = str(incorrect_score)


func _on_centre_card_timer_timeout() -> void:
	show_random_centre_card()
