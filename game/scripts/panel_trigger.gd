extends Sprite2D

var stillon := false
var inAnim := false

func _ready():
	hide()

func _process(delta: float) -> void:
	if inAnim or get_parent().inCamera or !get_parent().maxLeft:
		get_parent().get_node("panelTrigger").hide()
		return
	else:
		get_parent().get_node("panelTrigger").show()

	var trigger = get_rect().has_point(get_local_mouse_position())
	if !trigger:
		stillon = false

	if (trigger || Input.is_action_just_pressed("A")) && !stillon && global.interact && !get_parent().injumpscare: panelAnim()

func panelAnim():
	inAnim = true
	stillon = true
	playSound()

	get_parent().inPanel = !get_parent().inPanel

	get_parent().get_node("panelTrigger").hide()
	get_parent().get_node("panelOverlay").runAnimation()

func playSound():
	var pull := AudioStreamPlayer.new()
	pull.stream = load("res://game/audio/putdown.wav")
	pull.volume_db = -10
	add_child(pull)
	pull.play()
