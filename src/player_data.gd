class_name PlayerData extends Resource

@export var money: float = 0
@export var fry_money: float = 0 
@export var burger_money: float = 0 
func get_fry_money() -> float:
	return fry_money

func add_fry_money(value:float):
	fry_money += value
	
func get_burger_money() -> float:
	return burger_money
	
func add_burger_money(value:float):
	burger_money += value
