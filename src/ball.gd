class_name Ball extends Area2D

var data:PlayerData = load("res://player_data.tres")
var direction: Vector2
var speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = data.ball_speed
	direction = Vector2(-1,-0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction.normalized() * speed * delta
	
func get_radius():
	return 4

func _on_area_entered(area: Area2D) -> void:
	$ResetTimer.start()
	
func reset():
	position = Vector2(320, 196)
	direction = Vector2(-1,0)

func _on_reset_timer_timeout() -> void:
	reset()

func get_ball_pos():
	var powerup_pos = Vector2(int(position.x), int(position.y))
	data.set_powerup_position(powerup_pos)

func set_ball_speed(value:int):
	speed = value
