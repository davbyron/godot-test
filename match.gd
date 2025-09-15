extends Node2D

@onready var deck = $Deck
@onready var hand = $CenterContainer/Hand/CardContainer
@onready var board = $Board

const MAX_HAND_SIZE = 8

func _on_deck_clicked():
	if hand.get_child_count() >= MAX_HAND_SIZE:
		# TODO -- discard a card? burn a card? do nothing?
		print("Hand is full.")
		return
	
	var card = deck.deck_data.pick_random()
	
	if card:
		var card_scene = preload("res://Card.tscn").instantiate()
		card_scene.set_card_data(card)
		
		var offsetX = hand.get_child_count() * 200
		var offsetY = 150
		card_scene.position = Vector2(offsetX, offsetY)
		
		hand.add_child(card_scene)

func _ready():
	deck.connect("deck_clicked", Callable(self, "_on_deck_clicked"))
