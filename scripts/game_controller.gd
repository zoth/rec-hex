extends Node2D

signal play_made(id)
signal turn_change(type)

var _current_player = Utils.DARK_TYPE

func _ready():
	pass

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
	emit_signal("turn_change", _current_player)


