extends Node2D

@onready var deck = $Deck
@onready var hand = $CenterContainer/Hand/CardContainer
@onready var board = $Board

func _on_deck_clicked():
	var card = deck.deck_data.pick_random()
	
	if card:
		var card_scene = preload("res://Card.tscn").instantiate()
		card_scene.set_card_data(card)
		
		var offset = hand.get_child_count() * 200
		card_scene.position = Vector2(offset, 0)
		
		hand.add_child(card_scene)

func _ready():
	deck.connect("deck_clicked", Callable(self, "_on_deck_clicked"))
