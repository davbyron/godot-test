extends Area2D

var card_data

const NORMAL_SCALE := Vector2.ONE
const HOVER_SCALE := Vector2(1.5, 1.5)
const LIFT_AMOUNT := -200
const TWEEN_TIME := 0.15

var _tween: Tween
var base_position := Vector2.ZERO
var hover_offset := 0.0   # offset applied on top of layout position

@onready var visual := $Visual

func set_card_data(data):
	card_data = data
	$Visual/ColorRect/CenterContainer/Title.text = card_data.name

func _ready():
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	connect("mouse_exited", Callable(self, "_on_mouse_exited"))

func _on_mouse_entered():
	get_parent().call_deferred("on_card_hovered", self)
	hover_offset = LIFT_AMOUNT
	_update_hover()

func _on_mouse_exited():
	unhover()

func unhover():
	hover_offset = 0
	z_index = 0
	_update_hover()

func _update_hover():
	if _tween:
		_tween.kill()

	var target_scale = HOVER_SCALE if hover_offset < 0 else NORMAL_SCALE
	# Y position = base layout Y + hover offset
	var target_y = base_position.y + hover_offset

	_tween = get_tree().create_tween()
	_tween.set_parallel(true)

	_tween.tween_property(visual, "scale", target_scale, TWEEN_TIME)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	_tween.tween_property(self, "position:y", target_y, TWEEN_TIME)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
