extends Node

const STANDARD_ADVICE: String = "Try resting more, your workplace is over working you."
const PERSONAL_ADVICE: Array[String] = [
	"Take a 5-minute walk to refresh your mind.",
	"Drink some water and stretch a little.",
	"Close your eyes for a minute and breathe deeply.",
	"Try to organize your tasks and take small breaks.",
	"Listen to some calm music to relax your brain."
]

# Scoring
var fatigueScore: float
var reactionTimeScore: float
var memoryScore: float
var focusScore: float
var mentalAgilityScore: float
var decisionMakingScore: float	# TODO thius was missing from design doc
var recommendationHistory: String

func give_recommendation() -> String:
	var random_advice = PERSONAL_ADVICE[randi() % PERSONAL_ADVICE.size()]
	return random_advice + "\n" + STANDARD_ADVICE
	
func store_recommendation() -> void:
	pass

func get_fatigue_score() -> float:
	return reactionTimeScore + memoryScore + focusScore + mentalAgilityScore + decisionMakingScore
	
