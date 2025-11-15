extends Sprite2D


func _process(delta: float) -> void:
	if get_parent().inPanel:
		if get_parent().get_node("panelTrigger").visible: show()
	else: hide()
	
