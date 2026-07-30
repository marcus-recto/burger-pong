extends Area2D

signal play_noise
signal stop_noise

var data:PlayerData
var ball_inside:bool
var timer:float
var interval: float
var health: int
var texture:Texture2D
var color:Color
var ball:Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = load("res://player_data.tres")
	$ColorRect.color = color
	health = data.burger_health
	interval = data.burger_interval
	timer = 0
	ball_inside = false
	$CollisionShape2D.disabled = true
	$Label.visible = false
	$SetupTimer.start()
	$Sprite2D.texture = texture
	
	var audio_node = get_node(data.audio_path)
	play_noise.connect(audio_node.play_burger_crunch)
	stop_noise.connect(audio_node.stop_burger_crunch)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ball_inside:
		timer += delta
		if timer >= interval:
			timer -= interval
			add_to_ball()
			play_noise.emit()
			
	$Label.text = str(health)
			
# end of setup cooldown
func _on_setup_timer_timeout() -> void:
	$CollisionShape2D.disabled = false
	$Sprite2D.visible = true
	$ColorRect.queue_free()
	
# adds 1 to ball score and destroys itself if out of health
func add_to_ball():
	data.add_ball_score(1)
	health -= 1
	if health <= 0:
		ball.set_ball_speed(data.ball_speed)
		queue_free()
	
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		ball = area
		ball_inside = true
		area.set_ball_speed(data.slow_ball_speed)
		add_to_ball()
		$Label.visible = true
		$LabelTimer.stop()
		play_noise.emit()
		

		
func _on_area_exited(area: Area2D) -> void:
	if area.name == "Ball":
		ball_inside = false
		area.set_ball_speed(data.ball_speed)
		timer = 0
	if not is_queued_for_deletion():
		$LabelTimer.start()



func _on_label_timer_timeout() -> void:
	if ball_inside == false:
		$Label.visible = false
