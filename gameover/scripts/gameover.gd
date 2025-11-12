extends Node2D

@onready var numbers := [
	load("res://gameover/sprites/0.png"),
	load("res://gameover/sprites/1.png"),
	load("res://gameover/sprites/2.png"),
	load("res://gameover/sprites/3.png"),
	load("res://gameover/sprites/4.png"),
	load("res://gameover/sprites/5.png"),
	load("res://gameover/sprites/6.png"),
	load("res://gameover/sprites/7.png"),
	load("res://gameover/sprites/8.png"),
	load("res://gameover/sprites/9.png"),
	load("res://gameover/sprites/colon.png"),
]

@onready var deaths := [
	load("res://gameover/audio/death1.mp3"),
	load("res://gameover/audio/death2.mp3"),
	load("res://gameover/audio/death3.mp3"),
]

var overlay_alpha = 1.0
var sound := 0
var clicked := false
var allow_click := false

func _ready() -> void:
	gejover_fade()
	yap()
	await get_tree().create_timer(0.6).timeout
	allow_click = true


func _process(delta: float) -> void:
	if allow_click && Input.is_action_just_pressed("LEFT_BUTTON"): restart()
	
	if overlay_alpha > 0 && !clicked: # red
		overlay_alpha -= 2 * delta
		$overlay.modulate.a = overlay_alpha
	
	if overlay_alpha < 1 && clicked: # black
		overlay_alpha += 0.5 * delta
		$overlay.modulate.a = overlay_alpha
	
	if overlay_alpha >= 1 && clicked:
		get_tree().change_scene_to_file("res://nightenter/nightenter.tscn")
	
func gejover_fade():
	while true:
		var gejover_alpha = 1.0
		while gejover_alpha > 0:
			await get_tree().create_timer(0.1).timeout
			gejover_alpha -= 0.2
			$Gejover.modulate.a = gejover_alpha
		
		while gejover_alpha < 1:
			await get_tree().create_timer(0.05).timeout
			gejover_alpha += 0.2
			$Gejover.modulate.a = gejover_alpha
	
		await get_tree().create_timer(0.5).timeout

func _draw():
	var total = global.count
	var minutes = total / 60
	var seconds = total % 60

	var m = minutes % 10
	var s1 = seconds / 10
	var s2 = seconds % 10

	# im 99% sure i could do transform once and then just offset the pos but 
	# honestly im too lazy for this
	var x := 910
	var y := 560
	var c := Color(1,1,1,0.1)
	var s := Vector2(0.8,0.8)
	var e := Vector2(0,0)
	var w := 7
	
	draw_set_transform(Vector2(x,y), 0.0, s); draw_texture(numbers[m], e, c); x += numbers[m].get_width() - w
	draw_set_transform(Vector2(x,y), 0.0, s); draw_texture(numbers[10], e, c); x += numbers[10].get_width() - w
	draw_set_transform(Vector2(x,y), 0.0, s); draw_texture(numbers[s1], e, c); x += numbers[s1].get_width() - w
	draw_set_transform(Vector2(x,y), 0.0, s); draw_texture(numbers[s2], e, c)

func yap():
	await get_tree().create_timer(randf_range(0.5, 1.2)).timeout

	var yap = AudioStreamPlayer.new()
	yap.stream = deaths[randi_range(0, deaths.size()-1)]
	add_child(yap)
	yap.play()

func restart():
	$overlay.color = Color(0,0,0)
	overlay_alpha = 0.0
	clicked = true
	allow_click = false
