extends Object

var _type = Utils.NONE_TYPE setget set_type, get_type
var _neighbor = {}
var _name
var _top_edge = false
var _bottom_edge = false
var _right_edge = false
var _left_edge = false

func _init(n):
	_name = n
	
func set_type(t):
	_type = Utils.valid_type(t)
	
func get_type():
	return _type
	
func set_neighbor(k, v):
	_neighbor[Utils.valid_neighbor(k)] = v

func get_name():
	return _name
	
func set_edges(t, r, b, l):
	_top_edge = t
	_right_edge = r
	_bottom_edge = b
	_left_edge = l

const _to_string_format = "id:%s edges:t=%s, r=%s, b=%s, l=%s neighbors: %s"

func toString():
	var n = ""
	return _to_string_format % [_name, _top_edge, _right_edge, _bottom_edge, _left_edge, n]