extends Node
class_name Game  # ← THIS makes "Game" globally available as a type

var userScore: float

func win_game() -> void:
	GameManager.next_level()
	
func begin_play() -> void:
	pass
