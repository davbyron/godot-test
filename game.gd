extends Control

@onready var deck = $Deck
@onready var hand = $CenterContainer/Hand
@onready var board = $Board

func _ready():
	var card = preload("res://Card.tscn").instantiate()
	var card_data = load("res://cards/fireball.tres")
	card.set_card_data(card_data)
	hand.add_child(card)
