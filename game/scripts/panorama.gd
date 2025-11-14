extends Sprite2D

var max_left := 1440.0
var max_right := 550.0
var dis := 0.0
var scroll_speed := 600.0

# uh idk what is happening due to changing it all to keep window aspect ratio

func _process(delta: float) -> void:
	if position.x == max_left: get_parent().maxLeft = true
	else: get_parent().maxLeft = false
	if !global.interact: return
	# eksperymentalne, moze nie byc dobrym pomyslem
	if get_parent().busy && !global.panorama_in_camera: return

	
	var viewport_size = get_viewport().get_visible_rect().size
	var cursor_x = get_viewport().get_mouse_position().x
	
	var normalized_cursor = (cursor_x / viewport_size.x) * 1920.0
	var screen_center = 960.0
	
	scroll_speed = 600 * pow(abs(screen_center - normalized_cursor) / 480.0, 2)
	
	if cursor_x > viewport_size.x * 0.75 and position.x > max_right:
		dis = position.x - scroll_speed * delta
		position.x = max(dis, max_right)
	elif cursor_x < viewport_size.x * 0.25 and position.x < max_left:
		dis = position.x + scroll_speed * delta
		position.x = min(dis, max_left)
