extends Node2D

@onready var ui = $UI
@onready var board = $Board

@export var first_to_play := Gamemode.Turn.PLAYER


func _init():
	Gamemode.set_entity_turn(first_to_play)  # temp


func _ready():
	# UI
	var current_entity_to_play = Gamemode.get_current_entity_playing()
	ui.set_turn_ui(current_entity_to_play) 


func _unhandled_input(event):
	# When detecting a click on the mouse
	if event is InputEventMouseButton:
		# We make sure it's a left click and we proc the code when the button is released
		if event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
			# We are adding a pawn
			print(board.check_pawn_position(event.position))

