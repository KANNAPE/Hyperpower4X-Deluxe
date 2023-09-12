class_name Pawn
extends AnimatedSprite2D


func _init(type: Gamemode.Turn):
	if (type == Gamemode.Turn.PLAYER):
		animation = "player_1"
	else:
		animation = "player_2"
