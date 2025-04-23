extends User
class_name Manager

func get_user_type() -> String:
	return "Manager"

func can_access_reports() -> bool:
	return true
