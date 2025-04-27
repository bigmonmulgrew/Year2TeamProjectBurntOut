# GdUnit generated TestSuite
class_name FocusGameTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://Scripts/focus_game.gd'

func test_register_click() -> void:
	var focusgame = load("res://Scenes/_levels/FocusGame.tscn")
	var game: Game = focusgame.instantiate()
	
	get_tree().get_root().add_child(game)
	
	await get_tree().process_frame
	var taps: int = game.taps
	var differences_found: int = game.differences_found
	game.register_click(true)
	assert_int(taps).is_equal(game.taps)
	assert_int(differences_found + 1).is_equal(game.differences_found)
	
	taps = game.taps
	differences_found = game.differences_found
	game.register_click(false)
	assert_int(taps + 1).is_equal(game.taps)
	assert_int(differences_found).is_equal(game.differences_found)
