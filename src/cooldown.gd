extends Control

var tween
var offset = 32
func _ready() -> void:
	var screen_size = get_viewport_rect().size
	if name == "BlueFryIcon":
		position = Vector2((screen_size.x * (0.25) + (-offset)), 0)
	elif name == "RedFryIcon":
		position = Vector2((screen_size.x * (0.75) + (offset)), 0)
	elif name == "BlueBurgerIcon":
		position = Vector2((screen_size.x * (0.25) + (offset)), 0)
	else:
		position = Vector2((screen_size.x * (0.75) + (-offset)), 0)
	visible = true
	
func animate(length:float):
	$ColorRect.size.y = 32
	tween = create_tween()
	tween.tween_property($ColorRect, "size:y",0,length)

func pause_animation():
	if tween:
		tween.pause()
