extends Node
class_name User

var user_name: String
var user_id: int

func input(event: InputEvent) -> void:
	pass

# function overridden in subclasses to return subclass name
func get_user_type() -> String:
	return "User"

# function overridden in Manager to return True
func can_access_reports() -> bool:
	return false
