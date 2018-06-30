extends Node


var _cell_name_format = "x_%d_y_%d"
var board_size = 11

func make_cell_name(x, y):
	return _cell_name_format % [x,y]

