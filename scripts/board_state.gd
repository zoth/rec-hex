extends Object

const CellState = preload("cell_state.gd")

var _cells = {}
var _cell_path_points = {}
var _astar = null
var _completed_path = []
const _top_path_id = 1
const _right_path_id = 2
const _bottom_path_id = 3
const _left_path_id = 4

func _init():
	_astar = AStar.new()
	_astar.add_point(_top_path_id, Vector3(5,0,0))
	_astar.add_point(_bottom_path_id, Vector3(5,Utils.board_size,0))
	_astar.add_point(_left_path_id, Vector3(0,5,0))
	_astar.add_point(_right_path_id, Vector3(Utils.board_size,5,0))
	
	for x in range(Utils.board_size):
		for y in range(Utils.board_size):
			var n = Utils.make_cell_name(x,y)
			var c = CellState.new(x, y)
			_cells[c.get_name()] = c
			_cell_path_points[c.get_path_id()] = c
			_astar.add_point(c.get_path_id(), c.get_path_point(), 100)
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
			var l_upper = _cell(x, y - 1)
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

func free():
	_cells.clear()
	_cell_path_points.clear()
	_astar.free()
	.free()

func make_play(n, t):
	var game_won = false
	var c = _cells[n]
	c.set_type(t)
	for n in c.get_neighbors():
		if n.get_type() == t:
			_astar.connect_points(c.get_path_id(), n.get_path_id(), true)
	if t == Utils.LIGHT_TYPE:
		if c.is_right_edge():
			_astar.connect_points(c.get_path_id(), _right_path_id, true)
		elif c.is_left_edge():
			_astar.connect_points(c.get_path_id(), _left_path_id, true)
		game_won = _set_completed_path(_astar.get_id_path(_right_path_id, _left_path_id))
	elif t == Utils.DARK_TYPE:
		if c.is_top_edge():
			_astar.connect_points(c.get_path_id(), _top_path_id, true)
		elif c.is_bottom_edge():
			_astar.connect_points(c.get_path_id(), _bottom_path_id, true)
		game_won = _set_completed_path(_astar.get_id_path(_top_path_id, _bottom_path_id))
	return game_won

func _set_completed_path(points):
	if points.size() == 0:
		return false
	for p in points:
		if _cell_path_points.has(p):
			_completed_path.append(_cell_path_points[p].get_name())
	return true

func get_completed_path():
	return _completed_path
	
func get_random_free_cell():
	for c in _cells:
		var x = randi() % Utils.board_size
		var y = randi() % Utils.board_size
		var n = Utils.make_cell_name(x,y)
		if _cells[n].get_type() == Utils.NONE_TYPE:
			return n
	return null

func _cell(x, y):
	var n = Utils.make_cell_name(x,y)
	if(_cells.has(n)):
		return _cells[n]
	else:
		return null 
