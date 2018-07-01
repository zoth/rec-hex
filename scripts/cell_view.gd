extends Area2D

var cell_name = null setget set_cell_name, get_cell_name
var _type = Utils.NONE_TYPE setget set_type, get_type
var _mouse_hover = false
var _mouse_clicked = false
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
	_mouse_clicked = false
	if _type == Utils.NONE_TYPE:
		$light_cell.hide()
		$dark_cell.hide()

func _process(delta):
	if(Input.is_action_pressed("mouse_left")):
		if _mouse_hover == true && _type == Utils.NONE_TYPE && _mouse_clicked == false:
			_mouse_clicked = true
			board.cell_selected(cell_name)


func set_cell_name(n):
	cell_name = n

func get_cell_name():
	return cell_name

func set_type(t):
	_type = Utils.valid_type(t)
	match(_type):
		Utils.DARK_TYPE:
			$dark_cell.modulate = Color(1, 1, 1, 1)
			$dark_cell.show()
		Utils.LIGHT_TYPE:
			$light_cell.modulate = Color(1, 1, 1, 1)
			$light_cell.show()
		Utils.NONE_TYPE:
			$dark_cell.modulate = Color(1, 1, 1, 0.5)
			$light_cell.modulate = Color(1, 1, 1, 0.5)
			$light_cell.hide()
			$dark_cell.hide()

func get_type():
	return _type
