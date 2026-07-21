extends Area2D

var _up
var _down
var ball_x
var direction
var screen_size
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	if name == "LeftPaddle":
		_up = "left_move_up"
		_down = "left_move_down"
		ball_x = 1
	else:
		_up = "right_move_up"
		_down = "right_move_down"
		ball_x = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = Input.get_action_strength(_down) - Input.get_action_strength(_up)
	position.y = clamp(position.y + direction * speed * delta, 40 + 24, screen_size.y - 24)
