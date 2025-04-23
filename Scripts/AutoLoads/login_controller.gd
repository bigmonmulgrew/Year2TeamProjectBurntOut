extends Node

var username: String
var passwordHash: String
var userLoginToken : String

func validate_user() -> void:
	pass

func authenticate() -> void:
	userLoginToken = DatabaseManager.query_user(username, passwordHash)
	if userLoginToken == "1111111111":
		print("Login failed.")
		# TODO implement UI feedback here
	else:
		print("Login successful, user logged in.")
		# TODO implement UI feedback here and progress to dashboard

func authenticate_with_thumb(thumbHash: String) -> void:
	if(thumbHash == "XXXXXXDEBUGXXXXXX"):
		username = "User1"
		passwordHash = "5f4dcc3b5aa765d61d8327deb882cf99"
	else:
		push_error("Fetching username from thumb not currently implemented")
