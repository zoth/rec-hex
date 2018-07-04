extends Node

const board_size = 11

const TURN_CHANGE_EVENT = "turn_change"
const CELL_SELECTED_EVENT = "cell_selected"

enum {DARK_TYPE, LIGHT_TYPE, NONE_TYPE}
enum {TOP_NEIGHBOR, R_UPPER_NEIGHBOR, R_LOWER_NEIGHBOR, BOTTOM_NEIGHBOR, L_LOWER_NEIGHBOR, L_UPPER_NEIGHBOR, UNKOWN_NEIGHBOR}

func valid_type(t):
	if t == DARK_TYPE || t == LIGHT_TYPE:
		return t
	else:
		return NONE_TYPE

var _cell_name_format = "CELLx%dy%d"

func make_cell_name(x, y):
	return _cell_name_format % [x,y]

func valid_neighbor(n):
	if n == TOP_NEIGHBOR || n == R_UPPER_NEIGHBOR || n == R_LOWER_NEIGHBOR || n == BOTTOM_NEIGHBOR || n == L_LOWER_NEIGHBOR || n == L_UPPER_NEIGHBOR:
		return n
	else:
		return UNKOWN_NEIGHBOR

