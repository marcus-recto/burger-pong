extends Node
var data:PlayerData
func _ready() -> void:
	data = load("res://player_data.tres")
	data.audio_path = get_path()
	
func play_burger_crunch():
	$BurgerCrunch.play()

func stop_burger_crunch():
	$BurgerCrunch.stop()
	
func play_fry_blip_1():
	$RegularHit.play()
	$FryBlip1.play()
	
func play_fry_blip_2():
	$RegularHit.play()
	$FryBlip2.play()

func _play_score_increase() -> void:
	$ScoreIncrease.play()

func play_regular_hit():
	$RegularHit.play()
	
