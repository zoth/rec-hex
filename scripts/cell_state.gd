extends Object

var _type = Utils.NONE_TYPE setget set_type, get_type
var _neighbor = {}
var _name

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
