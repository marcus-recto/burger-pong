class_name PlayerData extends Resource

@export var ball_held_score: int = 0
@export var left_score: int = 0
@export var right_score: int = 0 
var powerup_position: Vector2

var max_fry_x: float
var min_fry_x: float
var fry_health: int = 10
var fry_adder: int = 1

var burger_health: int = 50
var burger_interval:float = 0.01

var ball_speed = 300
var slow_ball_speed = 75

var floor_path
var ceiling_path

var player1_color = Color("2176cc")
var player2_color = Color("ff7d6e")
func get_left_score() -> int:
	return left_score

func add_left_score():
	left_score += ball_held_score

func get_right_score() -> int:
	return right_score

func add_right_score():
	right_score += ball_held_score
	
func add_ball_score(value:int):
	ball_held_score += value

func get_ball_score() -> int:
	return ball_held_score
	
	
func get_powerup_position() -> Vector2:
	return powerup_position
	
func set_powerup_position(position:Vector2):
	powerup_position = position
	
