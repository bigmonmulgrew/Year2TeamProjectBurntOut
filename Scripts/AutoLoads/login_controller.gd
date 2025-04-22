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
