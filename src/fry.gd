extends Area2D

var hits

var data:PlayerData
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = load("res://player_data.tres")
	hits = data.fry_health
	$ColorRect.color = Color("Gray")
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout():
	$CollisionShape2D.disabled = false
	$ColorRect.color = Color("f7c100")
	$Timer.queue_free()
	if position.x < data.min_fry_x or position.x > data.max_fry_x:
		queue_free()

func _on_area_entered(area: Ball) -> void:
	if area.name == "Ball":
		area.direction = Vector2(-area.direction.x, 1)
		hits -= 1
		data.money += 0.5
		if hits <= 0:
			queue_free()

		
