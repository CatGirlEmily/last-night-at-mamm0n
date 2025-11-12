extends Sprite2D

func _ready() -> void:
	hide()



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("F7"): _jumpscare()

func _jumpscare():
	global.interact = false
	AutoLoad.rawr()
	await get_tree().create_timer(0.33).timeout
	show()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://gameover/gameover.tscn")
