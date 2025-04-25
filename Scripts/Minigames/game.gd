extends Node
class_name Game  # ← THIS makes "Game" globally available as a type

var userScore: float

func end_game() -> void:
	GameManager.next_level(userScore)
	
func begin_play() -> void:
	pass
