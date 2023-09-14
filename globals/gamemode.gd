extends Node

enum PlayingEntity {PLAYER = 1, AI = -1}

var _current_entity_playing: PlayingEntity


func set_entity_playing(entity: PlayingEntity):
	_current_entity_playing = entity


func get_current_entity_playing() -> PlayingEntity:
	return _current_entity_playing


## Returns the current new playing entity
func switch_turns() -> PlayingEntity:
	if _current_entity_playing == Gamemode.PlayingEntity.PLAYER:
		set_entity_playing(Gamemode.PlayingEntity.AI)
	else:
		set_entity_playing(Gamemode.PlayingEntity.PLAYER)
	return _current_entity_playing
