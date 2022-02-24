extends KinematicBody2D
var e = 0
var velocity = Vector2.ZERO
export var speed = 200

func _process(delta):
	velocity = Vector2.ZERO
	input()
	move_and_slide(velocity.normalized() * speed)

func input():
	if Input.is_action_pressed("ui_funny"):
		if e == 0:
			e = 1
			$dashtween.interpolate_property(self, 'speed', 1600, 200, 0.3, Tween.TRANS_LINEAR, Tween.EASE_OUT)
			$dashtween.start()
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 1
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1


func _on_dashtween_tween_all_completed():
	$Timer.start()


func _on_Timer_timeout():
	e = 0
