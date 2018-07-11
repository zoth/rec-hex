extends Sprite

signal cell_selected(n)

var _cells = {}
const _x_offset = -238
const _y_offset = -238
const _x_step_offset = 41.1
const _y_step_offset = 41.1
var player_turn = Utils.NONE_TYPE setget set_player_turn, get_player_turn
var cell_scene = null
var _play_enabled


func _ready():
	cell_scene = preload("res://scenes/cell_view.tscn")
			
func _reset(cells):
	for id in _cells.keys():
		var c = _cells[id]
		c.free()	
	for y in range(Utils.board_size):
		for x in range(Utils.board_size):
			var node = cell_scene.instance()
			node.move_local_x( _x_offset + ( _x_step_offset * x ) )
			node.move_local_y( _y_offset + ( _y_step_offset * y ) )
			node.cell_name = Utils.make_cell_name(x, y)
			node.board = self
			_cells[node.cell_name] = node
			if cells.has(node.cell_name):
				node.set_type(cells[node.name])
			add_child(node)

func set_player_turn(p):
	player_turn = p

func get_player_turn():
	return player_turn

func cell_selected(n):
	emit_signal(Utils.CELL_SELECTED_EVENT, n)

func _on_play_made(id):
	if _cells.has(id):
		var cell = _cells[id]
		cell.set_type(player_turn)

func _on_turn_change(type):
	player_turn = type

func _on_board_setup(cells, turn):
	_reset(cells)
	player_turn = turn

func _on_play_enabled(b):
	_play_enabled = b

func get_play_enabled():
	return _play_enabled



func _on_game_won(winning_path):
	for n in _cells:
		if !winning_path.has(n):
			_cells[n].show_dim()
