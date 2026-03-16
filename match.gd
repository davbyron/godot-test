extends Node2D

@onready var deck = $Deck
@onready var hand = $Hand
@onready var board = $Board

const MAX_HAND_SIZE = 8

func _reposition_hand():
	var spacing = 200        # horizontal distance between cards
	var y_offset = 150       # vertical offset
	var max_angle = 15       # max rotation in degrees (cards at edges)

	var count = hand.get_child_count()
	if count == 0:
		return

	var total_width = (count - 1) * spacing

	for i in range(count):
		var card = hand.get_child(i)
		if not card:
			continue

		# Center X positions
		var x = -total_width / 2 + i * spacing
		var target_pos = Vector2(x, y_offset)

		# Rotation calculation
		var t = 0.0
		if count > 1:
			t = i / float(count - 1)
		else:
			t = 0.5  # single card stays centered
			
		var angle_deg = lerp(-max_angle, max_angle, t)
		var angle_rad = deg_to_rad(angle_deg)

		# Tween position and rotation for smoothness
		var tween = get_tree().create_tween()
		tween.set_parallel(true)
		tween.tween_property(card, "position", target_pos, 0.2)\
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_property(card.visual, "rotation", angle_rad, 0.2)\
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			
		card.base_position = target_pos

func _on_deck_clicked():
	if hand.get_child_count() >= MAX_HAND_SIZE:
		# TODO -- discard a card? burn a card? do nothing?
		print("Hand is full.")
		return
	
	var card = deck.deck_data.pick_random()
	
	if card:
		var card_scene = preload("res://Card.tscn").instantiate()
		card_scene.set_card_data(card)
		
		hand.add_child(card_scene)
		
		_reposition_hand()

func _ready():
	deck.connect("deck_clicked", Callable(self, "_on_deck_clicked"))
	
	# center Hand on screen
	var viewport_size = get_viewport_rect().size
	$Hand.position = Vector2(viewport_size.x / 2, viewport_size.y - 200) 
	# ^ adjust Y so it sits near the bottom
