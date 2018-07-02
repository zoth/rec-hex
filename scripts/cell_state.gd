extends Object

var _type = Utils.NONE_TYPE setget set_type, get_type
var _neibors = {}

func _init():
	pass
	
func set_type(t):
	_type = Utils.valid_type(t)
	
func get_type():
	return _type
	
func set_nnnn(k, v):
	_neibors[Utils.valid_neiebor(k)] = v

