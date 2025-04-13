extends Area2D
class_name Deck

var card_data_paths = [
	"res://cards/pawnA.tres",
	"res://cards/pawnB.tres",
]

var deck_data : Array[CardData] = []

func _ready():
	for path in card_data_paths:
		var card = load(path) as CardData
		deck_data.append(card)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_parent()._on_deck_pressed()

func draw_card() -> CardData:
	return deck_data.pick_random()
