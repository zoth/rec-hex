extends Sprite

var _cells = {}
const _x_offset = -317
const _y_offset = -317
const _x_step_offset = 54.8
const _y_step_offset = 54.8

func _ready():
	var cell_scene = preload("res://scenes/cell_view.tscn")
	
	for y in range(Utils.board_size):
		for x in range(Utils.board_size):
			var node = cell_scene.instance()
			node.move_local_x( _x_offset + ( _x_step_offset * x ) )
			node.move_local_y( _y_offset + ( _y_step_offset * y ) )
			node.set_name( Utils.make_cell_name(x, y) )
			_cells[node.get_name()] = node
			add_child(node)
			
	


