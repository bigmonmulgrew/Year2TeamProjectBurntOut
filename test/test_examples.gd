# GdUnit generated TestSuite
class_name TestExamples
extends GdUnitTestSuite

func test_string_to_lower() -> void:
	assert_str("AbcD".to_lower()).is_equal("abcd")

func test_bool_is_true() -> void:
	# this assertion succeeds
	assert_bool(true).is_true()
	
func test_parameterized_int_values(a: int, b :int, c :int, expected :int, test_parameters := [
	[1, 2, 3, 6],
	[3, 4, 5, 12],
	[6, 7, 8, 21] ]):
	
	assert_that(a+b+c).is_equal(expected)

func test_fuzzer_inject_value(fuzzer := Fuzzers.rangei(-23, 22), fuzzer_iterations = 100):
	assert_int(fuzzer.next_value()).is_between(-23, 22)

# using multiple fuzzers in test are allowed
func test_fuzzer_inject_value_2(fuzzer_a := Fuzzers.rangei(-23, 22), fuzzer_b := Fuzzers.rangei(0, 42), fuzzer_iterations = 100):
	assert_int(fuzzer_a.next_value()).is_between(-23, 22)
	assert_int(fuzzer_b.next_value()).is_between(-23, 22)
