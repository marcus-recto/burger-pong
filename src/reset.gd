extends Area2D
signal play_audio
var data: PlayerData

var add_function:Callable

func _ready() -> void:
	data = load("res://player_data.tres")
	if name == "LeftWall":
		add_function = data.add_right_score
	else:
		add_function = data.add_left_score
		
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		area.start_reset()
		add_function.call()
		data.ball_held_score = 0
		play_audio.emit()
