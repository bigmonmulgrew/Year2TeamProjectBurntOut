extends Node2D

## Config
@export var image_sprites: Array[Sprite2D]

## Cached references
@onready var game_timer: Timer = $GameTimer

## Runtime variables
var image_textures: Array[Texture]
var selected_sprite: Sprite2D = null
var selectedTile: int = -1

func _ready() -> void:
	_shuffle_images()
		
func _shuffle_images():
	# Clear and collect textures
	image_textures.clear()
	for sprite in image_sprites:
		if sprite.texture:
			image_textures.append(sprite.texture)

	# Shuffle textures to ensure random assignment
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
	
func _calculate_score() -> int:
	var score: int = 0
	##  TODO add score scaling
	return score

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
		else:
			selectedTile = -1
