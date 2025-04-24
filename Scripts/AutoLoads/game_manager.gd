extends Node

const GAME_NUMBER_LIST: Array[int] = [0, 1, 2, 3, 4]
@onready var file_dialog: FileDialog = FileDialog.new()

## Runtime variables
var gameNumbers: Array[int]
var game: Game

var sessionsComplete: int = 0

# to be completed
func download_chart() -> void:
	take_full_screenshot()
	
func take_full_screenshot(path: String = "screenshot.png") -> void:
	await get_tree().process_frame
	var img: Image = get_viewport().get_texture().get_image()
	var result := img.save_png(path)
	if result == OK:
		print("Saved to:", path)
	else:
		push_error("Failed to save screenshot. Code: %s" % str(result))
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameNumbers = GAME_NUMBER_LIST
	
	file_dialog.file_mode = FileDialog.FILE_MODE_SAVE_FILE
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.filters = ["*.png ; PNG Images"]
	file_dialog.title = "Save Screenshot As"
	file_dialog.name = "screenshot.png"
	file_dialog.connect("file_selected", Callable(self, "take_full_screenshot"))
	add_child(file_dialog)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("take_screenshot"):
		file_dialog.popup_centered()

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
