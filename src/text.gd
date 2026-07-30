extends RichTextLabel

var data:PlayerData
var get_text:Callable
var amplitude:float = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	data = load("res://player_data.tres")
	if name == "BallScore":
		get_text = data.get_ball_score
		data.animate_ball_score.connect(animate)
	elif name == "LeftScore":
		get_text = data.get_left_score
		data.animate_left_score.connect(animate)
	elif name == "RightScore":
		get_text = data.get_right_score
		data.animate_right_score.connect(animate)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = ("[wave amp=%f freq=0 connected=1]"% (amplitude)) + str(get_text.call()) + "[/wave]"
	pass

func animate():
	var tween = create_tween()
	tween.tween_property(self, "position:y",-5,0.001)
	tween.tween_property(self, "position:y",0,0.2)
