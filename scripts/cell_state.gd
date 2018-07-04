extends Object

var _type = Utils.NONE_TYPE setget set_type, get_type
var _neighbor = {}
var _name
var _top_edge = false
var _bottom_edge = false
var _right_edge = false
var _left_edge = false
var _path_id
var _path_point

func _init(x, y):
	_name = Utils.make_cell_name(x,y)
	_path_id = x + (y * 100) + 100
	_path_point = Vector3(x + 1, y + 1, 0)
	
func set_type(t):
	_type = Utils.valid_type(t)
	
func get_type():
	return _type
	
func set_neighbor(k, v):
	_neighbor[Utils.valid_neighbor(k)] = v

func get_neighbors():
	var result = []
	for t in _neighbor:
		result.append(_neighbor[t])
	return result;

func get_name():
	return _name
	
func set_edges(t, r, b, l):
	_top_edge = t
	_right_edge = r
	_bottom_edge = b
	_left_edge = l

func get_path_id():
	return _path_id
	
func get_path_point():
	return _path_point

func is_top_edge():
	return _top_edge

func is_right_edge():
	return _right_edge

func is_bottom_edge():
	return _bottom_edge

func is_left_edge():
	return _left_edge

const _to_string_format = "id:%s %s pathId:%d %s"
const _f_2 = "edges:t=%s, r=%s, b=%s, l=%s"


func toString():
	var s_2 = _f_2 % [_top_edge, _right_edge, _bottom_edge, _left_edge]
	var s_3 = "neighbors:"
	
	if(_neighbor.has(Utils.TOP_NEIGHBOR)):
		s_3 += "top=" + _neighbor[Utils.TOP_NEIGHBOR].get_name() + " "
	if(_neighbor.has(Utils.R_UPPER_NEIGHBOR)):
		s_3 += "r upper=" + _neighbor[Utils.R_UPPER_NEIGHBOR].get_name() + " "
	if(_neighbor.has(Utils.R_LOWER_NEIGHBOR)):
		s_3 += "r lower=" + _neighbor[Utils.R_LOWER_NEIGHBOR].get_name() + " "
	if(_neighbor.has(Utils.BOTTOM_NEIGHBOR)):
		s_3 += "bottom=" + _neighbor[Utils.BOTTOM_NEIGHBOR].get_name() + " "
	if(_neighbor.has(Utils.L_LOWER_NEIGHBOR)):
		s_3 += "l lower=" + _neighbor[Utils.L_LOWER_NEIGHBOR].get_name() + " "
	if(_neighbor.has(Utils.L_UPPER_NEIGHBOR)):
		s_3 += "l upper=" + _neighbor[Utils.L_UPPER_NEIGHBOR].get_name() + " "
	
	
	return _to_string_format % [_name, s_2, _path_id, s_3]

