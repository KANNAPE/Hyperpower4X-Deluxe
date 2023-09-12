extends Node2D


const SIZE: int = 200
const ROWS: int = 6
const COLS: int = 7

var _board_array = [
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0]]


func add_new_pawn(position: Vector2i):
	# Checking if the given position is inside the grid
	pass
	
	
## Return the position unchanged if it corresponds to a point on the board (with a free column)
## If the point is not on the board or the matching column is full, returns -1;-1
func check_pawn_position(position: Vector2) -> Vector2:
	var correct_position = Vector2(-1, -1)
	
	# Checking if we are inside the board bounds and the column isn't full
	if (_is_position_on_board(position) and not _is_column_full(position)):
		correct_position = position
	
	return correct_position


## Returns true if the position corresponds to a point placed on the board
func _is_position_on_board(position: Vector2) -> bool:
	var is_on_board = false
	var center = get_viewport_rect().size / 2
	
	if (position.x <= center.x + SIZE / 2 and position.x >= center.x - SIZE / 2
			and position.y <= center.y + SIZE / 2 and position.y >= center.y - SIZE / 2):
		is_on_board = true
	
	return is_on_board
	
	
## Returns true if the column correspnding to the given position is full
func _is_column_full(position: Vector2) -> bool:
	return false


## Returns the highest position where to put the token on the column
func _get_highest_position_in_column(position: Vector2) -> Vector2:
	
	
	return Vector2()









