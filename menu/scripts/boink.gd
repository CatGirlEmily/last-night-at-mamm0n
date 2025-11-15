extends Button

func _pressed() -> void:
	var e = get_parent().get_node("bg").texture
	if e == load("res://menu/sprites/m5.png") or e == load("res://menu/sprites/m6.png"): return
	$boinkmp3.play()
	global.boink += 1
	global.saveData()
