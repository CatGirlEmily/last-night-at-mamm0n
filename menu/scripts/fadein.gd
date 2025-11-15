extends ColorRect

func _ready() -> void:
	show()

func _process(delta: float) -> void:
	if color.a > 0:
		color.a -= 0.8 * delta
