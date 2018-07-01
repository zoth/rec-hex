extends Sprite

signal zoth(n)
signal cell_selected(n)

var _cells = {}
const _x_offset = -317
const _y_offset = -317
const _x_step_offset = 54.8
const _y_step_offset = 54.8
var player_turn = Utils.DARK_TYPE setget set_player_turn, get_player_turn
var cell_scene = null



func _ready():
	cell_scene = preload("res://scenes/cell_view.tscn")
	
	for y in range(Utils.board_size):
		for x in range(Utils.board_size):
			var node = cell_scene.instance()
			node.move_local_x( _x_offset + ( _x_step_offset * x ) )
			node.move_local_y( _y_offset + ( _y_step_offset * y ) )
			node.cell_name = Utils.make_cell_name(x, y)
			node.board = self
			_cells[node.cell_name] = node
			add_child(node)
			

func set_player_turn(p):
	player_turn = p

func get_player_turn():
	return player_turn

func cell_selected(n):
	emit_signal("cell_selected", n)

