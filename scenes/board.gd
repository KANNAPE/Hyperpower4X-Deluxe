extends Node2D


const SIZE: int = 200
const ROWS: int = 6
const COLS: int = 7


func add_new_pawn(position: Vector2i):
	# Checking if the given position is inside the grid
	pass
	
	
## This function will determine if there is a valid position where to place the pawn depending on
## where the player clicked. 
## If the column is full or if the mouse was not hovering the board, this will return Vector2(-1, -1).
func check_pawn_position(position: Vector2) -> Vector2:
	var result = Vector2(-1, -1)
	# Checking if we are inside the board bounds
	var center = get_viewport_rect().size / 2
	if (position.x <= center.x + SIZE / 2 and position.x >= center.x - SIZE / 2
			and position.y <= center.y + SIZE / 2 and position.y >= center.y - SIZE / 2):
		result = position
	
	return result

