extends Node2D
class_name BoardSquare

enum SquareType { DIRT, WATER, GRASS, LAVA }

@export var type: SquareType = SquareType.DIRT
@export var occupied_by: Node = null  # Can store a card or unit

func change_type(new_type: SquareType):
	type = new_type
	update_visual()

func update_visual():
	# Change the sprite, color, or other visuals based on type
	$Sprite2D.texture = preload("res://assets/sludge_pool.png")
	#match type:
		#SquareType.DIRT:
			#$Sprite2D.texture = preload("res://textures/dirt.png")
		#SquareType.WATER:
			#$Sprite2D.texture = preload("res://textures/water.png")
		#_:
			#$Sprite2D.texture = preload("res://textures/default.png")
