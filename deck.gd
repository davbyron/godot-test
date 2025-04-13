extends Area2D
class_name Deck

signal deck_clicked

var card_data_paths = [
	"res://cards/pawnA.tres",
	"res://cards/pawnB.tres",
]

var deck_data : Array[CardData] = []

func _ready():
	for path in card_data_paths:
		var card = load(path) as CardData
		deck_data.append(card)

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("deck_clicked")
