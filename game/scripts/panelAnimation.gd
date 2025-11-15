extends Sprite2D



@onready var anim := [
	load("res://game/sprites/panel/1.png"),
	load("res://game/sprites/panel/2.png"),
	load("res://game/sprites/panel/3.png"),
	load("res://game/sprites/panel/4.png"),
	load("res://game/sprites/panel/5.png"),
	load("res://game/sprites/panel/6.png")
]

var do := false
var framec := 0
var frame_timer := 0.0
var frame_time := 0.35 / 7.0

func _ready() -> void:
	texture = anim[framec]

func runAnimation():
	show()
	do = true
	frame_timer = 0.0

func _process(delta: float) -> void:
	if !do: return

	var state = get_parent().inPanel
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
	get_parent().get_node("panelTriggerHitbox").inAnim = false
	get_parent().get_node("panelTrigger").show()
	hide()
