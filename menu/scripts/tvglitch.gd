extends TextureRect

@onready var textures = [
	load("res://menu/sprites/glitch1.png"),
	load("res://menu/sprites/glitch2.png"),
	load("res://menu/sprites/glitch3.png")
]

var alpha_target = 0.05
var alpha = 0.05
var current = 0
var pulse_timer = 0.0

func _ready() -> void:
	texture = textures[0]
	modulate.a = alpha

func _process(delta: float) -> void:
	if global.starting: return
	pulse_timer += delta * 60
	if int(pulse_timer) % 4 == 0:
		next_texture()
	
	var random_pulse = randf_range(-0.02, 0.02)
	alpha_target = clamp(0.05 + random_pulse, 0.02, 0.1)
	alpha = move_toward(alpha, alpha_target, delta * 2.0)
	modulate.a = alpha
	
	if randf() < 0.003:
		flash_glitch(delta)

func next_texture():
	current = (current + 1) % textures.size()
	texture = textures[current]

func flash_glitch(_delta: float):
	var flash_strength = randf_range(0.3, 0.6)
	alpha = flash_strength
	modulate.a = alpha
	await get_tree().create_timer(randf_range(0.05, 0.15)).timeout
	if global.starting: return
	alpha = 0.05
	modulate.a = alpha
