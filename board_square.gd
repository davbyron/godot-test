extends Node2D
class_name BoardSquare

func update_visual():
	# Change the sprite, color, or other visuals based on type
	$Sprite2D.texture = preload("res://assets/sludge_pool.png")
