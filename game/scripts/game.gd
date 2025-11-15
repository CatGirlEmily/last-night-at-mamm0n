extends Node2D

var dingdong := false
var overlay_a := 0.0
var t := 0.0

var injumpscare := false
var inCamera := false
var inPanel := false
var maxLeft := true
var busy := false

func _ready() -> void:
	$overlay.show()
	$overlay.color.a = 0.0
	
func _process(delta: float) -> void:
	busy = inCamera || inPanel
	if !injumpscare: global.count = $count.wait_time - $count.time_left
	
	if global.hour == 6:
		global.interact = false
		
		if !dingdong:
			AutoLoad.cya()
			dingdong = true
			t = 0.0
			return
		
		if t < 1.0:
			t += delta
			return
		
		overlay_a += delta
		if overlay_a > 1.0:
			get_tree().change_scene_to_file("res://nightfinish/nightfinish.tscn")
		
		$overlay.color.a = overlay_a


	
	
