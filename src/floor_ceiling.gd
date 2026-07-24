extends Area2D

var ball_y

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# changed to prevent merging through wall
	if name == "Ceiling":
		ball_y = 1	
	else:
		ball_y = -1

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		area.direction.y = ball_y
