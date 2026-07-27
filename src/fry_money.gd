extends Label

var data = load("res://player_data.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(data.left_score)
