extends Node

const DEBUG_USER: String = "User1"
const DEBUG_PASSWORD: String = "5f4dcc3b5aa765d61d8327deb882cf99"		# Md5 has generated from "password" at md5hashgenerator.com

## Runtime Variables
# DB connection
var username: String
var passwordHash: String
# var instance: Database TODO not valid, need to check how to access SQL in godot


# User
var userFeedback: Array[int]
var userAdditional: String
var employeeTeams: Array[int]
var employeeFatigueScore: int

func query_user(username: String, passwordHash: String) -> String:
	if username != DEBUG_USER or passwordHash != DEBUG_PASSWORD:
		print("Incorrect username or password")
		return "1111111111"
	else:
		print("User logged in")	
		return "0000000000"

func store_data(reactionTimeScore: float, memoryScore: float, focusScore: float, mentalAgilityScore: float, decisionMakingScore: float) -> void:
	# TODO database implementation team to provide Databse connector
	var sqlQuery: String = ""
	var fatigueScore: float = RecommendationEngine.get_fatigue_score()
	var timestamp: String = Time.get_datetime_string_from_system()
		
	sqlQuery = "INSERT INTO UserStats (username, fatigueScore, timestamp) " + \
			 "VALUES ('%s', %f, '%s') " % [username, fatigueScore, timestamp]
	
	print("Database content stored successfully.\n")
	print("Database query string: " + sqlQuery)
	

# Now in recommendation en gine since that is where they are stored
#func find_valid_feedback() -> void:
#	pass

func get_fatigue_history(isManager: bool = false) -> Array[int]:
	
	print("Using canned data for debugging.")
	
	return [
		randi() % 51,
		randi() % 51,
		randi() % 51,
		randi() % 51,
		randi() % 51
	]
	
func get_feedback_history() -> Array[float]:
	print("Using canned data for debugging.")
	
	return [
		randf() * 5,
		randf() * 5,
		randf() * 5,
		randf() * 5,
		randf() * 5
	]
