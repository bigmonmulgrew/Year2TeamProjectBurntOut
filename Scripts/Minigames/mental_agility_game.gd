extends Game

## Config
@export var image_sprites: Array[Sprite2D]

## Cached references
@onready var game_timer: Timer = $GameTimer

## Runtime variables
var image_textures: Array[Texture]		# List of textures still to be assigned to a tile
var validation_textures: Array[Texture] # List of textures used to validate final output
var selected_sprite: Sprite2D = null
var selectedTile: int = -1
var moves:int = 0

func _ready() -> void:
	_shuffle_images()
		
func _shuffle_images():
	# Clear and collect textures
	image_textures.clear()
	for sprite in image_sprites:
		if sprite.texture:
			image_textures.append(sprite.texture)

	# Shuffle textures to ensure random assignment
	validation_textures = image_textures.duplicate()
	image_textures.shuffle()

	# Assign random texture to each sprite and remove it from the list
	for sprite in image_sprites:
		if image_textures.size() > 0:
			var random_texture = image_textures.pop_back()  # Removes from end
			sprite.texture = random_texture
			
func _on_sprite_clicked(event: InputEvent, sprite: Sprite2D) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if selected_sprite == null:
			selected_sprite = sprite
		elif selected_sprite != sprite:
			# Swap textures
			var temp = selected_sprite.texture
			selected_sprite.texture = sprite.texture
			sprite.texture = temp
			# Reset selection
			selected_sprite = null
		else:
			# Clicked same sprite again, deselect it
			selected_sprite = null

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int, index: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if selectedTile == -1:
			selectedTile = index
		elif selectedTile != index:
			# Swap textures
			var temp = image_sprites[selectedTile].texture
			
			image_sprites[selectedTile].texture = image_sprites[index].texture
			image_sprites[index].texture = temp
			# Reset selection
			selectedTile = -1
			
			moves += 1
			
			_validate_grid()
			
		else:
			selectedTile = -1
	
func _validate_grid() -> void:
	var current_grid: Array[Texture] = []
	for sprite in image_sprites:
		if sprite.texture:
			current_grid.append(sprite.texture)
	
	if _compare_texture_arrays(current_grid, validation_textures):
		print("Win")
		userScore = _calculate_score()
		end_game()
	else:
		print("Not there yet")

func _calculate_score() -> int:
	var score: int = 10
	
	if moves > 10:
		score -= (moves - 10) * -1
		
	if game_timer.time_left == 0:
		score -= 5
		
	score = clamp(score, 0, 10)
	
	return score

func _compare_texture_arrays(a: Array, b: Array) -> bool:
	if a.size() != b.size():
		return false
		
	for i in a.size():
		if a[i] != b[i]:
			return false
			
	return true
