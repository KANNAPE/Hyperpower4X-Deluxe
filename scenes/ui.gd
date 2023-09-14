extends CanvasLayer

var entity_strings = {Gamemode.PlayingEntity.PLAYER: "Player", Gamemode.PlayingEntity.AI: "IA"}

@onready var entity_turn_label = $MarginContainer/TurnLabel/EntityTurnLabel

func set_turn_ui(entity_playing: Gamemode.PlayingEntity):
	entity_turn_label.text = entity_strings[entity_playing]
