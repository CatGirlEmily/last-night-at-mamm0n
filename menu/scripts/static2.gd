extends ColorRect

var flashing := false
var fade_speed := 6.0
var alpha_target := 0.0
var alpha := 0.0

func _ready() -> void:
	hide()
	modulate.a = 0.0

func _process(delta: float) -> void:
	if global.starting: return
	position.y = randi_range(0, 1080)
	
	if not flashing and randf() < 0.05:
		flash()
	

	alpha = move_toward(alpha, alpha_target, delta * fade_speed)
	modulate.a = alpha

	if flashing and alpha <= 0.0 and alpha_target == 0.0:
		flashing = false
		hide()

func flash():
	flashing = true
	show()
	alpha_target = 0.596
	await get_tree().create_timer(randf_range(0.1, 0.3)).timeout
	alpha_target = 0.0
