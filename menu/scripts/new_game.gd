extends Button

func _ready():
	connect("mouse_entered", Callable(self, "_on_mouse_enter"))
	connect("mouse_exited", Callable(self, "_on_mouse_exit"))

func _on_mouse_enter():
	$Select.play()
	$arrowNewGame.show()

func _on_mouse_exit():
	$arrowNewGame.hide()

func _pressed() -> void:
	global.night = 1
	get_node("../newspaper")._starting()
