extends Timer

func _ready() -> void:
	timeout.connect(_enternight)
	
func _enternight():
	global.hour = 0
	global.interact = true
	get_tree().change_scene_to_file("res://game/game.tscn")
