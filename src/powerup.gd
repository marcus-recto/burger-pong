extends Timer
signal ball_position_request

var request_name
var player_data:PlayerData = load("res://player_data.tres")
var fry_price
var fry_ball_y
@export var fry_scene:PackedScene

func _ready() -> void:
	one_shot = true
	if name == "FryTimer":
		request_name = "left_fry_request"
		fry_ball_y = 1
	elif name == "FryTimer2":
		request_name = "right_fry_request"
		fry_ball_y = -1
	elif name == "BurgerTimer":
		request_name = "left_burger_request"
	else:
		request_name = "right_burger_request"
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(request_name):
		if time_left == 0:
			start()
			ball_position_request.emit()
			make_fry()
			
func make_fry()->void:
	var fry: Area2D = fry_scene.instantiate()
	fry.position = player_data.get_powerup_position()
	fry.ball_y = fry_ball_y
	add_child(fry)
	
	
	
