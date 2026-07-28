extends Timer
signal ball_position_request

var request_name
var player_data:PlayerData = load("res://player_data.tres")
var fry_price
var fry_ball_y
@export var fry_scene:PackedScene
@export var burger_scene:PackedScene
var make_function:Callable

var fry_texture
var burger_texture
var player_color:Color

func _ready() -> void:
	one_shot = true
	if name == "FryTimer":
		request_name = "left_fry_request"
		make_function = make_fry
		fry_ball_y = 1
		fry_texture = load("res://assets/fry_down.png")
		player_color = player_data.player1_color
	elif name == "FryTimer2":
		request_name = "right_fry_request"
		fry_ball_y = -1
		make_function = make_fry
		fry_texture = load("res://assets/fry_up.png")
		player_color = player_data.player2_color
	elif name == "BurgerTimer":
		request_name = "left_burger_request"
		make_function = make_burger
		burger_texture = load("res://assets/blueburger.png")
		player_color = player_data.player1_color
	else:
		request_name = "right_burger_request"
		make_function = make_burger
		burger_texture = load("res://assets/redburger.png")
		player_color = player_data.player2_color
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(request_name):
		if time_left == 0:
			start()
			ball_position_request.emit()
			make_function.call()
			
func make_fry()->void:
	var fry: Area2D = fry_scene.instantiate()
	fry.position = player_data.get_powerup_position()
	fry.ball_y = fry_ball_y
	fry.texture = fry_texture
	fry.player_color = player_color
	add_child(fry)
	
func make_burger()->void:
	var burger: Area2D = burger_scene.instantiate()
	burger.position = player_data.get_powerup_position()
	burger.texture = burger_texture
	burger.color = player_color
	add_child(burger)
	
	
	
