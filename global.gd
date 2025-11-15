extends Node

var dev = true

var quitTime = 0
var night = 0
var starting = false
var hour = -1
var interact = true
var count := 0
var panorama_in_camera := false
var boink := 0

func getSaveData():
	var save = ConfigFile.new()
	var response = save.load("user://data")
	
	if response == OK:
		night = save.get_value("data", "night")
		boink = save.get_value("misc", "secret")
		if night > 6: night = 6
	else:
		save.set_value("data", "night", 1)
		save.set_value("misc", "secret", 0)
		night = 1
		save.save("user://data")		
		

func _ready() -> void:
	Engine.max_fps = 100
	getSaveData()

func _process(delta: float) -> void:
	#var scene = get_tree().current_scene.name
	
	if Input.is_action_pressed("ESCAPE"): quitTime += 1 * delta
	if Input.is_action_just_released("ESCAPE"): quitTime = 0
	if quitTime > 0.5: get_tree().quit()

	if Input.is_action_just_pressed("F1"): restart()
	if Input.is_action_just_pressed("DEL"): deleteData()
	
	if dev && Input.is_action_just_pressed("F2"): hour += 1
	if dev && Input.is_action_just_pressed("F3"): nightComplete()
	if dev && Input.is_action_just_pressed("F4"): get_tree().change_scene_to_file("res://nightfinish/nightfinish.tscn")
	if dev && Input.is_action_just_pressed("F5"): get_tree().change_scene_to_file("res://gameover/gameover.tscn")
	if dev && Input.is_action_just_pressed("F6"): count += 3
	
	
func restart():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
	quitTime = 0
	getSaveData()
	starting = false
	AutoLoad.stop()

func nightComplete():
	count = -1
	hour = -1
	starting = false
	if night < 6: night += 1
	saveData()

func deleteData():
	night = 1
	boink = 0
	saveData()
	
func saveData():
	var save = ConfigFile.new()
	save.set_value("data", "night", night)
	save.set_value("misc", "secret", boink)
	save.save("user://data")

func isValidHour():
	return hour >= 0 && hour < 6
