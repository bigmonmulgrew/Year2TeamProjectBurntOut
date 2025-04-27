# GdUnit generated TestSuite
class_name RecommendationEngineTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://Scripts/AutoLoads/recommendation_engine.gd'


func test_give_recommendation() -> void:
	# remove this line and complete your test
	
	var result: String = RecommendationEngine.give_recommendation()
	assert_str(result).ends_with(RecommendationEngine.STANDARD_ADVICE)
