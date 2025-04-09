extends Node

class_name Deck

var shuffled_deck : Array = []

var card_data_paths = [
	"res://cards/fireball.tres",
]

var deck_data : Array[CardData] = []

func _ready():
	for path in card_data_paths:
		var card = load(path) as CardData
		deck_data.append(card)

func draw_card() -> CardData:
	return shuffled_deck.pop_back()
