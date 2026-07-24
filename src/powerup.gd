extends Timer
var request_name

func _ready() -> void:
	one_shot = true
	if name == "FryTimer":
		request_name = "fry_request"
	else:
		request_name = "burger_request"
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(request_name):
		if time_left == 0:
			start()
			print("yes")
