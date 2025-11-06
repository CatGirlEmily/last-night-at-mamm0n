extends ColorRect

var overlay_a = 1.0

func _process(delta: float) -> void:
	overlay_a -= delta
	color.a = overlay_a
