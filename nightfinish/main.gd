extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global.nightComplete()
	$"put back in menu".timeout.connect(putbackinmenu)


func putbackinmenu():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
