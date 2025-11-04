extends Sprite2D

var fade = false
var alpha = 0.0
var awaiting = false
var fadeout = false
var dark = 0.0
var skip = false
var skipalpha = 0.0

func _ready() -> void:
	$blockInput.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$blockInput.hide()

func _process(delta: float) -> void:
	if skip:
		skipalpha += 0.6*delta
		modulate.a = skipalpha
		
	
	if fade:
		alpha += 0.3*delta
		modulate.a = alpha
		if alpha > 1:
			fade = false
			awaiting = true
	
	if fadeout:
		dark += 0.7*delta
		modulate = Color(1.0 - dark, 1.0 - dark, 1.0 - dark)
	
	if dark > 1.5 || skipalpha > 1.5: get_tree().change_scene_to_file("res://nightenter/nightenter.tscn")
	
func _starting():
	global.starting = true
	$blockInput.mouse_filter = Control.MOUSE_FILTER_STOP
	$blockInput.show()
	
	if global.night > 1:
		skip = true
		skipalpha = 0.0
		modulate = Color(0,0,0, 0)
		return
	
	fade = true

func _input(event: InputEvent) -> void:
	if !global.starting || !awaiting: return
	if event.is_pressed():
		fadeout = true
		awaiting = false
		
