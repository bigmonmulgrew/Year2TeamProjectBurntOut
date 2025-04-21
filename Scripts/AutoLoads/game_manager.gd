extends Node

var reactionTimeLevel: PackedScene
var memoryLevel: PackedScene
var focusLevel: PackedScene
var mentalAgilityLevel: PackedScene
var decisionMakingLevel: PackedScene
var current_scene : Node

var game: Game

func load_level(level) -> void:
	call_deferred("_deferred_load_level", level)

func _deferred_load_level(level):
	current_scene.free()
	
	var new_scene = ResourceLoader.load(level)
	current_scene = new_scene.instantiate()
	
	get_tree().get_root().add_child(current_scene)
	
	get_tree().set_current_scene(current_scene)

func return_to_dashboard() -> void:
	# commented out because dashboard does not exist yet
	# load_level(dashboard_level)
	pass

# to be completed
func download_chart() -> void:
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(current_scene.name)
