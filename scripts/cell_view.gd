extends Area2D

var _name = null setget set_name, get_name

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func set_name(n):
	_name = n

func get_name():
	return _name