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

var overlay_alpha = 1.0

func _ready() -> void:
	gejover_fade()

func _process(delta: float) -> void:	
	if overlay_alpha > 0: # red
		overlay_alpha -= 2 * delta
		$overlay.modulate.a = overlay_alpha
	
	
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

	var x := 980
	var y := 540
	var c := Color(1,1,1,0.33)
	draw_texture(numbers[m], Vector2(x,y), c); x += numbers[m].get_width()
	draw_texture(numbers[10], Vector2(x,y), c); x += numbers[10].get_width()
	draw_texture(numbers[s1], Vector2(x,y), c); x += numbers[s1].get_width()
	draw_texture(numbers[s2], Vector2(x,y), c)
