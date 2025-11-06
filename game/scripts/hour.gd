extends Sprite2D

@onready var textures = [
	load("res://game/sprites/am/12am.png"),
	load("res://game/sprites/am/1am.png"),
	load("res://game/sprites/am/2am.png"),
	load("res://game/sprites/am/3am.png"),
	load("res://game/sprites/am/4am.png"),
	load("res://game/sprites/am/5am.png"),
	load("res://game/sprites/am/6am.png")
]


func _ready() -> void:
	$hourTime.timeout.connect(_hourPassed)
	texture = textures[0]
	
func _process(_delta: float) -> void:
	texture = textures[global.hour]


func _hourPassed():
	if global.hour >= 6: return
	global.hour += 1
	$hourTime.start()
