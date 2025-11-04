extends Sprite2D

@onready var textures = [
	load("res://menu/sprites/m2.png"), # normal light
	load("res://menu/sprites/m3.png"), # dim
	load("res://menu/sprites/m4.png"), # darker
	load("res://menu/sprites/m5.png"), # dark no antagonist
	load("res://menu/sprites/m6.png")  # dim no antagonist
]

var normal_index := 0
var flash_timer := 0.0
var current_texture := 0
var is_flash := false

func _ready() -> void:
	randomize()
	texture = textures[normal_index]

func _process(delta: float) -> void:
	if global.starting: return
	flash_timer -= delta

	if flash_timer <= 0 and !is_flash:
		if randf() < 0.03:
			_start_flash()

	elif is_flash and flash_timer <= 0:
		_end_flash()


func _start_flash() -> void:
	is_flash = true
	flash_timer = randf_range(0.1, 0.3)
	current_texture = randi_range(1, textures.size() - 1)
	texture = textures[current_texture]

func _end_flash() -> void:
	is_flash = false
	flash_timer = randf_range(0.1, 0.3)
	texture = textures[normal_index]
