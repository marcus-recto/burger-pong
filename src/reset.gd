extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		area.position = Vector2(320, 180)
		area.direction = Vector2(-1,0)
