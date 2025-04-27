# GdUnit generated TestSuite
class_name MentalAgilityGameTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://Scripts/Minigames/mental_agility_game.gd'

func test__calculate_score() -> void:
	# remove this line and complete your test
	# Load the full scene, not the script
	var packed_scene: PackedScene = load("res://Scenes/_levels/Mental Agility Game.tscn")
	var game: Game = packed_scene.instantiate()
	
	get_tree().get_root().add_child(game)  # Add it to the scene tree so it can fully initialize
	
	await get_tree().process_frame
	
	var value:int = game._calculate_score()
	
	assert_int(value).is_greater_equal(0)
	assert_int(value).is_less_equal(10)
	
	game.free()
