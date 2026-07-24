class_name Ball extends Area2D

var data:PlayerData = load("res://player_data.tres")
var direction: Vector2
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = Vector2(-1,-0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction.normalized() * speed * delta
	
func get_radius():
	return 4

func _on_area_entered(area: Area2D) -> void:
	$ResetTimer.start()
	
func reset():
	position = Vector2(320, 180)
	direction = Vector2(-1,0)

func _on_reset_timer_timeout() -> void:
	reset()

func get_ball_pos():
	data.set_powerup_position(position)
