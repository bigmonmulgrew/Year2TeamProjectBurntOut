# GdUnit generated TestSuite
class_name TestPersonTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://Scripts/test_person.gd'

func test_full_name() -> void:
	# remove this line and complete your test
	# assert_not_yet_implemented() # Example code defined by default
	var person = load("res://Scripts/test_person.gd").new("King", "Arthur")
	assert_str(person.full_name()).is_equal("King Arthur")
	person.free()		# Releases used memory
