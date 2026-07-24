extends Area2D

var data: PlayerData

var add_function:Callable

func _ready() -> void:
	data = load("res://player_data.tres")
	if name == "LeftWall":
		add_function = data.add_fry_money
	else:
		add_function = data.add_burger_money
		
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		area.reset()
		add_function.call(data.money)
		data.money = 0
