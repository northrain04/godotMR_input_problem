extends VBoxContainer

var selected: int = 0 :
	set = set_selected

var labels: Array[Label] = []


func _ready() -> void:
	var _index: int = 0
	
	# Register children
	for _child in get_children():
		if _child is Label:
			labels.push_back(_child)
			
			if _index == selected:
				_child.modulate.v = 1.0
			else:
				_child.modulate.v = 0.5
				
			_index += 1


func _input(_event: InputEvent) -> void:
	if _event.is_action_pressed("control_up"):
		selected -= 1
	
	if _event.is_action_pressed("control_down"):
		selected += 1
	

func set_selected(_selected: int) -> void:
	var _value: int = wrap(_selected, 0, labels.size())
	
	labels[selected].modulate.v = 0.5
	labels[_value].modulate.v = 1.0
	
	selected = _value
