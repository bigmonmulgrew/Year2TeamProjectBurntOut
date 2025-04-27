# GdUnit generated TestSuite
class_name GameManagerTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://Scripts/AutoLoads/game_manager.gd'

func test__pick_random_unique() -> void:
	# remove this line and complete your test
	var value:int = GameManager._pick_random_unique()
	assert_int(value).is_between(0, 4)
	assert_int(value).is_not_equal(-1)
	
	#Test 5 times because the array has 5 members
	value = GameManager._pick_random_unique()
	assert_int(value).is_between(0, 4)
	assert_int(value).is_not_equal(-1)
	
	value = GameManager._pick_random_unique()
	assert_int(value).is_between(0, 4)
	assert_int(value).is_not_equal(-1)
	
	value = GameManager._pick_random_unique()
	assert_int(value).is_between(0, 4)
	assert_int(value).is_not_equal(-1)
	
	value = GameManager._pick_random_unique()
	assert_int(value).is_between(0, 4)
	assert_int(value).is_not_equal(-1)
	
