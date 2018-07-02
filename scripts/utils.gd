extends Node

const board_size = 11

const TURN_CHANGE_EVENT = "turn_change"
const CELL_SELECTED_EVENT = "cell_selected"

enum {DARK_TYPE, LIGHT_TYPE, NONE_TYPE}
enum {TOP, RIGHT_UPPER, RIGHT_LOWER, BOTTOM, LEFT_LOWER, LEFT_UPPER, N_UNKOWN}

func valid_type(t):
	if t == DARK_TYPE || t == LIGHT_TYPE:
		return t
	else:
		return NONE_TYPE

var _cell_name_format = "CELLx%dy%d"

func make_cell_name(x, y):
	return _cell_name_format % [x,y]

func valid_neiebor(n):
	if n == TOP || n == RIGHT_UPPER || n == RIGHT_LOWER || n == BOTTOM || n == LEFT_LOWER || n == LEFT_UPPER:
		return n
	else:
		return N_UNKOWN

