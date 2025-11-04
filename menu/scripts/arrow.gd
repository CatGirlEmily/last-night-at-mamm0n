extends Sprite2D

var showTime := 0.0
var state := true

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if global.starting: return
	if not visible:
		return

	showTime += delta
	if showTime >= 0.5:
		state = !state
		modulate.a = 1.0 if state else 0.0
		showTime = 0.0
