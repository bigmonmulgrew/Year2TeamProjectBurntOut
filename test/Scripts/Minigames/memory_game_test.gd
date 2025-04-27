# GdUnit generated TestSuite
class_name MemoryGameTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://Scripts/Minigames/memory_game.gd'


func test_start_new_round(fuzzer:= Fuzzers.rangei(3, 10), fuzzer_iterations = 10) -> void:
	var packed_scene: PackedScene = load("res://Scenes/_levels/Memory Game.tscn")
	var game: Game = packed_scene.instantiate()
	get_tree().get_root().add_child(game)
	
	game.start_new_round(fuzzer.next_value())
	
	assert_array(game.user_input).is_empty()
	assert_array(game.sequence).is_not_empty()
