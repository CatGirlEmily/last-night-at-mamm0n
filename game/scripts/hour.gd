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
	
	if global.dev && Input.is_action_just_pressed("F4"): _hourPassed()


func _hourPassed():
	if global.hour >= 6: return
	global.hour += 1
	if global.hour == 5 && global.night > 2: survive()
	$hourTime.start()

func survive():
	await get_tree().create_timer(30).timeout
	$Survive.play()
	
