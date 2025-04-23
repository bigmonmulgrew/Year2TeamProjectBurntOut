extends User
class_name Employee

#stores data from the current session, can be discarded when data saved to database
var session_data: Dictionary = {}

func get_user_type() -> String:
	return "Employee"
