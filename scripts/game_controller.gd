extends Node2D

signal play_made(id)
signal turn_change(type)
signal board_setup(cells, turn)

var _current_player = Utils.DARK_TYPE

func _ready():
	_start()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_cell_selected(id):
	emit_signal("play_made", id)
	if _current_player == Utils.DARK_TYPE:
		_current_player = Utils.LIGHT_TYPE
	else:
		_current_player = Utils.DARK_TYPE
	emit_signal(Utils.TURN_CHANGE_EVENT, _current_player)

func _start():
	emit_signal("board_setup",{},_current_player)
