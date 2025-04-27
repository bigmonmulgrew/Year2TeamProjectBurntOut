# GdUnit generated TestSuite
class_name LoginControllerTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://Scripts/AutoLoads/login_controller.gd'

func test_authenticate_with_thumb() -> void:
	assert_bool(LoginController.authenticate_with_thumb("XXXXXXDEBUGXXXXXX")).is_true()
	assert_bool(LoginController.authenticate_with_thumb("dsadsafgdsfdgfad")).is_false()

func test_authenticate() -> void:
	assert_bool(LoginController.authenticate()).is_false()	 # No details of the user are provided without thumb so should always be false
