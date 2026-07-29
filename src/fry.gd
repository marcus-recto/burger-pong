extends Area2D

var hits
signal bumped(ball:Ball)
signal play_noise
var ball_y = 0
var texture:Texture2D   # set by powerup request
var player_color

var data:PlayerData
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = load("res://player_data.tres")
	hits = data.fry_health
	$ColorRect.color = player_color
	$Timer.start()
	var floor_node: FloorCeiling = get_node(data.floor_path)
	var ceiling_node: FloorCeiling = get_node(data.ceiling_path)
	bumped.connect(floor_node.adjust_ball)
	bumped.connect(ceiling_node.adjust_ball)
	$Sprite2D.texture = texture
	

func _on_timer_timeout():
	$CollisionShape2D.disabled = false
	$ColorRect.queue_free()
	$Timer.queue_free()
	if position.x < data.min_fry_x or position.x > data.max_fry_x:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		area.direction = Vector2(-area.direction.x, ball_y)
		hits -= 1
		data.add_ball_score(data.fry_adder)
		bumped.emit(area)
		play_noise.emit()
		if hits <= 0:
			queue_free()

func connect_audio_signal(function:Callable):
	play_noise.connect(function)
		
