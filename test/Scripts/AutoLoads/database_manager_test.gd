# GdUnit generated TestSuite
class_name DatabaseManagerTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://Scripts/AutoLoads/database_manager.gd'


func test_query_user() -> void:
	
	# Test for an invalid user
	var result: String = DatabaseManager.query_user("valid User", "validpassword")
	assert_str(result).is_equal_ignoring_case("1111111111")
	
	#Test for valid user
	result  = DatabaseManager.query_user("User1", "5f4dcc3b5aa765d61d8327deb882cf99")
	assert_str(result).is_equal_ignoring_case("0000000000")
