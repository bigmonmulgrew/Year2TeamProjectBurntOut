extends Node

const GAME_NUMBER_LIST: Array[int] = [0, 1, 2, 3, 4]

## Runtime variables
var gameNumbers: Array[int]
var game: Game

var sessionsComplete: int = 0



func return_to_dashboard() -> void:
	# commented out because dashboard does not exist yet
	# load_level(dashboard_level)
	pass

# to be completed
func download_chart() -> void:
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameNumbers = GAME_NUMBER_LIST


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pick_random_unique() -> int:
	if gameNumbers.size() == 0:
		gameNumbers = GAME_NUMBER_LIST
		return -1

	var index = randi() % gameNumbers.size()
	var value = gameNumbers[index]
	gameNumbers.remove_at(index)
	return value

func _load_next_game():
	
	sessionsComplete += 1
	var gameType = _pick_random_unique()
	match gameType:
		1:
			LevelManager.load_level(LevelManager.get_random_focus_level())
		2:
			LevelManager.load_level(LevelManager.get_random_reaction_level())
		3:
			LevelManager.load_level(LevelManager.get_random_agility_level())
		4:
			LevelManager.load_level(LevelManager.get_random_decision_level())
		5:
			LevelManager.load_level(LevelManager.get_random_memory_level())
		-1:
			LevelManager.load_main_menu()
	

func next_level():
	# Call with "GameManager.next_level()"
	_load_next_game()

func begin_play():
	_load_next_game()
