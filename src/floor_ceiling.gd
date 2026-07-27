class_name FloorCeiling extends Area2D

var ball_y
var _inside:bool = false
var data:PlayerData

#var fry_timer #delete

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	data = load("res://player_data.tres")
	if name == "Ceiling":
		ball_y = 1
		data.ceiling_path = get_path()
	else:
		ball_y = -1
		data.floor_path = get_path()
	
	#fry_timer = get_node("../FryTimer")# delete


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		_inside = true
		area.direction.y = ball_y
		#if data.fry_money >= 5:
			#fry_timer.ball_position_request.emit()
			#fry_timer.make_fry()
			#data.fry_money -= 5
		
func adjust_ball(ball:Ball):
	if _inside:
		ball.direction.y = ball_y


func _on_area_exited(_area: Area2D) -> void:
	_inside = false
