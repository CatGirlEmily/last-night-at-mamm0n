extends Sprite2D

func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	if get_parent().inCamera:
		if get_parent().get_node("cameraTrigger").visible: show()
	else: hide()
		
