extends Object

const CellState = preload("cell_state.gd")

var _cells = {}

func _init():
	for x in range(Utils.board_size):
		for y in range(Utils.board_size):
			var n = Utils.make_cell_name(x,y)
			var c = CellState.new(n)
			_cells[n] = c
	var limit = Utils.board_size - 1
	for x in range(Utils.board_size):
		for y in range(Utils.board_size):
			var top_edge = (y == 0)
			var bottom_edge = (y == limit)
			var right_edge = (x == limit)
			var left_edge = (x == 0)
			var c = _cell(x, y)
			c.set_edges(top_edge, right_edge, bottom_edge, left_edge)
			var top = _cell(x + 1, y - 1)
			var r_upper = _cell(x + 1, y)
			var r_lower = _cell(x, y + 1)
			var bottom = _cell(x - 1, y + 1)
			var l_lower = _cell(x - 1, y)
			var l_upper = _cell(x - 1, y - 1)
			if(top != null):
				c.set_neighbor(Utils.TOP_NEIGHBOR, top)
			if(r_upper != null):
				c.set_neighbor(Utils.R_UPPER_NEIGHBOR, r_upper)
			if(r_lower != null):
				c.set_neighbor(Utils.R_LOWER_NEIGHBOR, r_lower)
			if(bottom != null):
				c.set_neighbor(Utils.BOTTOM_NEIGHBOR, bottom)
			if(l_lower != null):
				c.set_neighbor(Utils.L_LOWER_NEIGHBOR, l_lower)
			if(l_upper != null):
				c.set_neighbor(Utils.L_UPPER_NEIGHBOR, l_upper)

func get_cells():
	return _cells

func _cell(x, y):
	var n = Utils.make_cell_name(x,y)
	if(_cells.has(n)):
		return _cells[n]
	else:
		return null 
