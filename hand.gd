extends Node2D

func on_card_hovered(card):
	for child in get_children():
		if child == card:
			continue
		if child.has_method("unhover"):
			child.unhover()
	
	# bring hovered card to front
	move_child(card, -1)
	card.z_index = 100
