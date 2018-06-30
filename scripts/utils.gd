extends Node


var _cell_name_format = "x_%d_y_%d"
const board_size = 11
enum {DARK_TYPE, LIGHT_TYPE, NONE_TYPE}

func make_cell_name(x, y):
	return _cell_name_format % [x,y]

