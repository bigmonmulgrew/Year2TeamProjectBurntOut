extends User
class_name Employee

# temporarily stores data from the current session, such as scores, can be discarded when data saved to database
var session_data: Dictionary = {}

func get_user_type() -> String:
	return "Employee"
