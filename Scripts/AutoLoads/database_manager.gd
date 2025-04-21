extends Node

## Runtime Variables
# DB connection
var username: String
var passwordHash: String
# var instance: Database TODO not valid, need to check how to access SQL in godot

# Scoring
var fatigueScore: float
var reactionTimeScore: float
var memoryScore: float
var focusScore: float
var mentalAgilityScore: float
var decisionMakingScore: float

# User
var userFeedback: Array[int]
var userAdditional: String
var employeeTeams: Array[int]
var employeeFatigueScore: int

func query_user() -> void:
	pass

func store_data() -> void:
	pass

func find_valid_feedback() -> void:
	pass

func find_valid_fatigue_score() -> void:
	pass
