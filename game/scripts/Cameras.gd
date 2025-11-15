extends Sprite2D

var dotBig = false

func _ready() -> void:
	$camDot.pivot_offset = $camDot.size / 2
	dot()

func dot():
	await get_tree().create_timer(0.5).timeout
	$camDot.scale = Vector2(0.5, 0.5)
	await get_tree().create_timer(0.5).timeout
	$camDot.scale = Vector2(1.5, 1)
	dot()


func _process(delta: float) -> void:
	if get_parent().inCamera:
		if get_parent().get_node("cameraTrigger").visible: show()
	else: hide(); return;	
	
