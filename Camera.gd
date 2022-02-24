extends Camera2D
var e = 0

func _process(delta):
	if Input.is_action_pressed("ui_funny"):
		if e == 0:
			e = 1
			$camZoom.interpolate_property(self, 'zoom', Vector2(0.95,0.95), Vector2(1,1), 0.3, Tween.TRANS_LINEAR)
			$camZoom.start()

func _on_camZoom_tween_all_completed():
	$Timer.start()
	

func _on_Timer_timeout():
	e = 0
