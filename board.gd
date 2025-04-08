extends Node2D
class_name Board

const BOARD_SQUARE = preload("res://board_square.tscn")
const BOARD_SQUARE_WIDTH = 64
const BOARD_SQUARE_HEIGHT = 64

const BOARD_WIDTH = 10
const BOARD_HEIGHT = 8

func _ready():
	var total_width = BOARD_WIDTH * BOARD_SQUARE_WIDTH
	var total_height = BOARD_HEIGHT * BOARD_SQUARE_HEIGHT

	# Center this Board node in the viewport
	var viewport_size = get_viewport().get_visible_rect().size
	position = (viewport_size - Vector2(total_width, total_height)) / 2

	for y in range(BOARD_HEIGHT):
		for x in range(BOARD_WIDTH):
			var board_square_instance = BOARD_SQUARE.instantiate()
			board_square_instance.position = Vector2(x * BOARD_SQUARE_WIDTH, y * BOARD_SQUARE_HEIGHT)
			add_child(board_square_instance)
