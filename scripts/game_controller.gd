extends Node2D

const BoardState = preload("board_state.gd")

signal play_made(id)
signal turn_change(type)
signal board_setup(cells, turn)
signal play_enabled(b)

var _current_player = Utils.DARK_TYPE
var _board_state

func _ready():
	_start()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_cell_selected(id):
	_board_state.get_cells()[id].set_type(_current_player)
	emit_signal("play_made", id)
	if _current_player == Utils.DARK_TYPE:
		_current_player = Utils.LIGHT_TYPE
	else:
		_current_player = Utils.DARK_TYPE
	emit_signal(Utils.TURN_CHANGE_EVENT, _current_player)
	print(_board_state.get_cells()[id].toString())

func _start():
	_board_state = BoardState.new()
	emit_signal("board_setup",{},_current_player)
	emit_signal("play_enabled", true )
