extends Area2D

var ball_y

# Called when the node enters the scene tree for the first time

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		area.direction.y = -area.direction.y
