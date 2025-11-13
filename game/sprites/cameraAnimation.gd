extends Sprite2D

@onready var anim := [
	load("res://game/sprites/cam/1.png"),
	load("res://game/sprites/cam/2.png"),
	load("res://game/sprites/cam/3.png"),
	load("res://game/sprites/cam/4.png"),
	load("res://game/sprites/cam/5.png"),
	load("res://game/sprites/cam/6.png"),
	load("res://game/sprites/cam/7.png")
]

var do := false
var framec := 0
var frame_timer := 0.0
var frame_time := 0.35 / 7.0

func _ready() -> void:
	texture = anim[framec]
	hide()

func runAnimation():
	show()
	do = true
	frame_timer = 0.0

func _process(delta: float) -> void:
	if !do: return

	var state = get_parent().inCamera
	frame_timer += delta

	if frame_timer >= frame_time:
		frame_timer = 0.0

		if state:
			framec += 1
			if framec >= anim.size():
				framec = anim.size() - 1
				stop()
				return
		else:
			framec -= 1
			if framec < 0:
				framec = 0
				stop()
				return

		texture = anim[framec]

func stop():
	do = false
	get_parent().get_node("cameraTrigger").show()
	hide()
