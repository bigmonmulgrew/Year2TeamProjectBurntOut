# GdUnit generated TestSuite
class_name ReactionGameTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://Scripts/Minigames/reaction_game.gd'


func test__calculate_score() -> void:
	# remove this line and complete your test
	var packed_scene: PackedScene = load("res://Scenes/_levels/Reaction Game.tscn")
	var game: Game = packed_scene.instantiate()
	get_tree().get_root().add_child(game)
	await get_tree().process_frame
	var value: int = game._calculate_score()
	assert_int(value).is_between(0, 10)
	game.free()
