extends TextureButton

@onready var textures = [
	load("res://menu/sprites/n1.png"),
	load("res://menu/sprites/n2.png"),
	load("res://menu/sprites/n3.png"),
	load("res://menu/sprites/n4.png"),
	load("res://menu/sprites/n5.png"),
	load("res://menu/sprites/n6.png")
]

func _ready():
	connect("mouse_entered", Callable(self, "_on_mouse_enter"))
	connect("mouse_exited", Callable(self, "_on_mouse_exit"))
	texture_normal = textures[0]

func _process(_delta: float) -> void:
	texture_normal = textures[global.night - 1]

func _on_mouse_enter():
	$Select.play()
	$arrowNight.show()

func _on_mouse_exit():
	$arrowNight.hide()

func _pressed():
	get_node("../newspaper")._starting()
