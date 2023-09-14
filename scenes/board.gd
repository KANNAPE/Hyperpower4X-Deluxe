extends Node2D


const SIZE: int = 200
const ROWS: int = 6
const COLS: int = 7

@export var token_scene: PackedScene

@onready var tokens := $Tokens

var _board_array = [
		[0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0]]


## Returns true if the given position is located on the board, false if not
func is_position_valid(position: Vector2) -> bool:
	var is_valid = false
	var center = get_viewport_rect().size / 2  # Center of the screen == center of the board
	if (position.x <= center.x + SIZE / 2 and position.x >= center.x - SIZE / 2
			and position.y <= center.y + SIZE / 2 and position.y >= center.y - SIZE / 2):
		is_valid = true
	return is_valid
	

func get_column_index(position: Vector2) -> int:
	var center = get_viewport_rect().size / 2
	var adjusted_board_center = Vector2(center.x - SIZE / 2, center.y - SIZE / 2)
	var adjusted_horizontal_position = position.x - adjusted_board_center.x
	var index: int = (adjusted_horizontal_position * COLS) / SIZE
	return index


## Tries to instantiate and place a new token on a given column
func try_add_token(col_index: int) -> bool:
	var success = false
	# If the column at index col_index is not full:
	if _board_array[ROWS - 1][col_index] == 0:
		# We instantiate the new token and add it to the tokens node
		var new_token: Token = token_scene.instantiate()
		tokens.add_child(new_token)
		# We then set its animation parameter (the color of the token)
		var entity_playing = Gamemode.get_current_entity_playing()
		new_token.animation = "player_1" if entity_playing == 1 else "player_2"
		# We retrieve the highest free index in the column and fill the board array
		var highest_row_index = _get_highest_row_index(col_index)
		_board_array[highest_row_index][col_index] = entity_playing
		# Lastly, we compute the position of the token with the value of its row/col indexes
		new_token.position = _compute_position_by_indexes(highest_row_index, col_index)
		success = true
	return success


func _get_highest_row_index(col_index: int) -> int:
	var highest_row_index = -1
	for row_index in range(ROWS):
		if _board_array[row_index][col_index] == 0:
			highest_row_index = row_index
			break
	return highest_row_index


## Returns the computed board position according to the row and col indexes
func _compute_position_by_indexes(row_index: int, col_index: int) -> Vector2:
	# Horizontal position
	var horizontal_offset = -SIZE / 2 + SIZE / (COLS * 2)
	var horizontal_position = horizontal_offset + (SIZE * col_index) / COLS
	# Vertical position
	var vertical_offset = SIZE / 2 - SIZE / (ROWS * 2)
	var vertical_position = vertical_offset - (SIZE * row_index) / ROWS
	# Result
	return Vector2(horizontal_position, vertical_position)

