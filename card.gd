extends Control

var card_data: CardData

func set_card_data(data: CardData):
	card_data = data
	$ColorRect/CenterContainer/Label.text = card_data.name
	#$Sprite.texture = card_data.image
