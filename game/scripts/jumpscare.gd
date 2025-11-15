extends Sprite2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("F7"): _jumpscare()

func _jumpscare():
	get_parent().get_node("Cams").hide()
	if get_parent().inCamera: get_parent().get_node("cameraTriggerHitbox").camAnim()
	if get_parent().inPanel: get_parent().get_node("panelTriggerHitbox").panelAnim()
	
	global.interact = false
	AutoLoad.rawr()
	await get_tree().create_timer(0.33).timeout
	show()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://gameover/gameover.tscn")
