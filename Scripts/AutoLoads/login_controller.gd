extends Node

var username: String
var passwordHash: String
var userLoginToken : String

func validate_user() -> void:
	pass

func authenticate() -> bool:
	userLoginToken = DatabaseManager.query_user(username, passwordHash)
	if userLoginToken == "1111111111":
		print("Login failed.")
		return false
		# TODO implement UI feedback here
	else:
		print("Login successful, user logged in.")
		return true
		# TODO implement UI feedback here and progress to dashboard

func authenticate_with_thumb(thumbHash: String) -> bool:
	username = ""
	passwordHash = ""
	if(thumbHash == "XXXXXXDEBUGXXXXXX"):
		username = "User1"
		passwordHash = "5f4dcc3b5aa765d61d8327deb882cf99"
		return authenticate()
	else:
		
		push_error("Fetching username from thumb not currently implemented")
		return authenticate()
