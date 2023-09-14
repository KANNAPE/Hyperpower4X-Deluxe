extends Node2D

@export var first_to_play := Gamemode.PlayingEntity.PLAYER

@onready var ui := $UI
@onready var board := $Board


func _ready():
	# UI
	Gamemode.set_entity_playing(first_to_play)  # temp
	ui.set_turn_ui(first_to_play) 


func _unhandled_input(event):
	# When detecting a click on the mouse
	if event is InputEventMouseButton:
		# We make sure it's a left click and we proc the code when the button is released
		if event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
			# We check if the position is valid
			if board.is_position_valid(event.position):
				# If it is, we try to add a new token (will not work is the column is full)
				var column_index = board.get_column_index(event.position)
				if board.try_add_token(column_index):
					# Switching turns returns the new entity that is playing, very handy!
					ui.set_turn_ui(Gamemode.switch_turns())
				else:
					print("column is full!")
	
