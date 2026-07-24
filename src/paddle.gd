extends Area2D

var _up
var _down
var ball_x
var direction
var screen_size
var speed = 200
var data :PlayerData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = load("res://player_data.tres")
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
	
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		var ball_y = (area.position.y - position.y) / (24 + area.get_radius())
		area.direction = Vector2(ball_x, ball_y)
		data.money += 1


func _on_reset_timer_timeout() -> void:
	pass # Replace with function body.
