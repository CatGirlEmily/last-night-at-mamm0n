extends Node


var quitTime = 0
var night = 0
var starting = false

func getSaveData():
	night = randi_range(2,6)

func _ready() -> void:
	Engine.max_fps = 100
	getSaveData()

func _process(delta: float) -> void:
	if Input.is_action_pressed("ESCAPE"): quitTime += 1 * delta
	if Input.is_action_just_released("ESCAPE"): quitTime = 0
	if quitTime > 0.5: get_tree().quit()
	if Input.is_action_just_pressed("F2"): restart()

func restart():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
	quitTime = 0
	getSaveData()
	starting = false
