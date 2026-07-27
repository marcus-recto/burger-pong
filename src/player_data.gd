class_name PlayerData extends Resource

@export var money: float = 0
@export var fry_money: float = 5
@export var burger_money: float = 0 
var powerup_position: Vector2

var max_fry_x: float
var min_fry_x: float
var fry_health: int = 10
var fry_price: float = 5

var floor_path
var ceiling_path

func get_fry_money() -> float:
	return fry_money

func get_fry_price() -> float:
	return fry_price

func add_fry_money(value:float):
	fry_money += value
	
func get_burger_money() -> float:
	return burger_money
	
func add_burger_money(value:float):
	burger_money += value
	
func get_powerup_position() -> Vector2:
	return powerup_position
	
func set_powerup_position(position:Vector2):
	powerup_position = position
	
