extends Node

## Configuration
@export_category("Default Screens")
@export var mainMenu: 		PackedScene
@export var loginScreen: 	PackedScene
@export var userDashboard: 	PackedScene

# Minigames
@export_category("Mninigames")
@export var reactionTimeLevels: 	Array[PackedScene]
@export var memoryLevels: 		Array[PackedScene]
@export var focusLevels:			Array[PackedScene]
@export var mentalAgilityLevels:	Array[PackedScene]
@export var decisionMakingLevels:Array[PackedScene]

## Runtime variables
var current_scene : Node

func load_level(level) -> void:
	call_deferred("_deferred_load_level", level)

func _deferred_load_level(level):
	# Safety check since current_scene will be null on start
	if current_scene:
		current_scene.free()
		
	var scene_to_instance: PackedScene
	
	if typeof(level) == TYPE_STRING:
		scene_to_instance = ResourceLoader.load(level)
	elif level is PackedScene:
		scene_to_instance = level
	else:
		push_error("Invalid level type passed to load_level: " + str(level))
		return
	
	if scene_to_instance:
		current_scene = scene_to_instance.instantiate()
		get_tree().get_root().add_child(current_scene)
		get_tree().set_current_scene(current_scene)
	else:
		push_error("Failed to load or instantiate the scene.")

func load_main_menu():
	load_level(mainMenu)
	
func load_login_page():
	load_level(loginScreen)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_scene = get_tree().get_current_scene()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func get_random_focus_level():
	return focusLevels[randi() % focusLevels.size()]

func get_random_reaction_level():
	return reactionTimeLevels[randi() % reactionTimeLevels.size()]

func get_random_agility_level():
	return mentalAgilityLevels[randi() % mentalAgilityLevels.size()]

func get_random_decision_level():
	return decisionMakingLevels[randi() % decisionMakingLevels.size()]

func get_random_memory_level():
	return memoryLevels[randi() % memoryLevels.size()]


