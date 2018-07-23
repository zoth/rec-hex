extends Node2D

const BoardState = preload("board_state.gd")

signal play_made(id)
signal turn_change(type)
signal board_setup(cells, turn)
signal play_enabled(b)
signal game_won(winning_path)

var _current_player = Utils.DARK_TYPE
var _board_state = null


func _ready():
	randomize()
	_start()

func _on_cell_selected(id):
	_make_play(id)

func _start():
	
	if(_board_state != null):
		_board_state.free()	
	_board_state = BoardState.new()
	
	emit_signal("board_setup",{})
	for x in range(9):
		var n = _board_state.get_random_free_cell()
		emit_signal("play_made", n, _current_player)
		_board_state.make_play(n,_current_player)
		_change_turn()
	emit_signal(Utils.TURN_CHANGE_EVENT, _current_player)
	emit_signal("play_enabled", true )

func _make_play(n):
	emit_signal("play_enabled", false )
	emit_signal("play_made", n, _current_player)
	if _board_state.make_play(n,_current_player):
		emit_signal("game_won", _board_state.get_completed_path())
	else:
		_change_turn()
		emit_signal("play_enabled", true )
		emit_signal(Utils.TURN_CHANGE_EVENT, _current_player)

	
func _change_turn():
	if _current_player == Utils.DARK_TYPE:
		_current_player = Utils.LIGHT_TYPE
	else:
		_current_player = Utils.DARK_TYPE
	