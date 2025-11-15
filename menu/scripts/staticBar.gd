extends ColorRect

func _process(delta: float) -> void:
	if global.starting: return
	position.y += delta * 50
	if position.y > 1080: position.y = -50
