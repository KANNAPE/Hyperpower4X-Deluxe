extends CanvasLayer

@onready var entity_turn_label = $MarginContainer/TurnLabel/EntityTurnLabel

func set_turn_ui(entity: String):
	entity_turn_label.text = entity
