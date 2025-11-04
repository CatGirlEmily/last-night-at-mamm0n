extends TextureRect

@onready var textures = [
	load("res://nightenter/sprites/1n.png"),
	load("res://nightenter/sprites/2n.png"),
	load("res://nightenter/sprites/3n.png"),
	load("res://nightenter/sprites/4n.png"),
	load("res://nightenter/sprites/5n.png"),
	load("res://nightenter/sprites/6n.png")
]

func _ready() -> void:
	texture = textures[global.night - 1]
