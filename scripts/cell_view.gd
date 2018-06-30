extends Area2D

var cell_name = null setget set_cell_name, get_cell_name
var _type = Utils.NONE_TYPE setget set_type, get_type
var _mouse_hover = false
var board = null setget set_board, get_board

func set_board(b):
	board = b

func get_board():
	return board

func _ready():
	connect("mouse_entered", self, "on_mouse_entered")
	connect("mouse_exited", self, "on_mouse_exited")
	$dark_cell.modulate = Color(1, 1, 1, 0.5)
	$light_cell.modulate = Color(1, 1, 1, 0.5)

func on_mouse_entered():
	_mouse_hover = true
	if _type == Utils.NONE_TYPE:
		if get_board().player_turn == Utils.DARK_TYPE:
			$dark_cell.show()
		elif get_board().player_turn == Utils.LIGHT_TYPE:
			$light_cell.show()
		

func on_mouse_exited():
	_mouse_hover = false
	if _type == Utils.NONE_TYPE:
		$light_cell.hide()
		$dark_cell.hide()




func set_cell_name(n):
	cell_name = n

func get_cell_name():
	return cell_name

func set_type(t):
	_type = t

func get_type():
	return _type
