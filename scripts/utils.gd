extends Node

const board_size = 11

enum {DARK_TYPE, LIGHT_TYPE, NONE_TYPE}

func valid_type(t):
	if t == DARK_TYPE || t == LIGHT_TYPE:
		return t
	else:
		return NONE_TYPE

var _cell_name_format = "CELLx%dy%d"

func make_cell_name(x, y):
	return _cell_name_format % [x,y]

