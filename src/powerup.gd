extends Timer
signal ball_position_request

var request_name
var player_data:PlayerData = load("res://player_data.tres")
var fry_price
@export var fry_scene:PackedScene

func _ready() -> void:
	one_shot = true
	if name == "FryTimer":
		request_name = "fry_request"
		fry_price = player_data.get_fry_price()
	else:
		request_name = "burger_request"

		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(request_name):
		if time_left == 0 and player_data.get_fry_money() >= fry_price:
			start()
			ball_position_request.emit()
			make_fry()
			player_data.add_fry_money(-fry_price)
			
func make_fry()->void:
	var fry: Area2D = fry_scene.instantiate()
	fry.position = player_data.get_powerup_position()
	add_child(fry)
	
	
	
