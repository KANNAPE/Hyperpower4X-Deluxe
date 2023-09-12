extends Node

enum Turn {PLAYER, AI}

var turn: Turn


func set_entity_turn(entity: Turn):
	turn = entity

func get_current_entity_playing() -> String:
	return Turn.keys()[turn]
