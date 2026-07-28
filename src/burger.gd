extends Area2D

var data:PlayerData
var ball_inside:bool
var timer:float
var interval: float
var health: int
var texture:Texture2D
var color:Color

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ball_inside:
		timer += delta
		if timer >= interval:
			timer -= interval
			add_to_ball()
	$Label.text = str(health)
			
# end of setup cooldown
func _on_setup_timer_timeout() -> void:
	$CollisionShape2D.disabled = false
	
	$ColorRect.queue_free()
	
# adds 1 to ball score and destroys itself if out of health
func add_to_ball():
	data.add_ball_score(1)
	health -= 1
	if health <= 0:
		queue_free()
	
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Ball":
		ball_inside = true

		
func _on_area_exited(area: Area2D) -> void:
	if area.name == "Ball":
		ball_inside = false
