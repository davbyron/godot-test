extends Node2D

var card_data: CardData

func set_card_data(data: CardData):
	card_data = data
	$ColorRect/CenterContainer/Title.text = card_data.name
