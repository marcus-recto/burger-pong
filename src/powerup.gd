extends Timer
signal ball_position_request

var request_name
var player_data:PlayerData = load("res://player_data.tres")
var fry_price
var fry_ball_y
@export var fry_scene:PackedScene
@export var burger_scene:PackedScene
var make_function:Callable

func _ready() -> void:
	one_shot = true
	if name == "FryTimer":
		request_name = "left_fry_request"
		make_function = make_fry
		fry_ball_y = 1
	elif name == "FryTimer2":
		request_name = "right_fry_request"
		fry_ball_y = -1
		make_function = make_fry
	elif name == "BurgerTimer":
		request_name = "left_burger_request"
		make_function = make_burger
	else:
		request_name = "right_burger_request"
		make_function = make_burger
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(request_name):
		if time_left == 0:
			print(request_name)
			start()
			ball_position_request.emit()
			make_function.call()
			
func make_fry()->void:
	var fry: Area2D = fry_scene.instantiate()
	fry.position = player_data.get_powerup_position()
	fry.ball_y = fry_ball_y
	add_child(fry)
	
func make_burger()->void:
	var burger: Area2D = burger_scene.instantiate()
	burger.position = player_data.get_powerup_position()
	add_child(burger)
	
	
	
