extends Object

var _type = Utils.NONE_TYPE setget set_type, get_type
var _neighbor = {}

func _init():
	pass
	
func set_type(t):
	_type = Utils.valid_type(t)
	
func get_type():
	return _type
	
func set_neighbor(k, v):
	_neighbor[Utils.valid_neighbor(k)] = v

