extends Sprite2D

var stillon := false


func _ready():
	hide()

func _process(_delta: float) -> void:
	if get_parent().inPanel: get_parent().get_node("cameraTrigger").hide(); return
	else: get_parent().get_node("cameraTrigger").show()
	if get_parent().get_node("cameraOverlay").visible: get_parent().get_node("cameraTrigger").hide()

	var trigger = get_rect().has_point(get_local_mouse_position())
	if !trigger: stillon = false

	if (trigger or Input.is_action_just_pressed("S")) && !stillon && global.interact && !get_parent().injumpscare && get_parent().get_node("cameraTrigger").visible: camAnim()

func camAnim():
	playSound()
	stillon = true


	get_parent().inCamera = !get_parent().inCamera

	get_parent().get_node("cameraTrigger").hide()
	get_parent().get_node("cameraOverlay").runAnimation()

func playSound():
	var pull := AudioStreamPlayer.new()
	pull.stream = load("res://game/audio/putdown.wav")
	pull.volume_db = -10
	add_child(pull)
	pull.play()
