extends KinematicBody2D

var speed = 0
var max_speed = 400
var acceleration = 800
var moving = false

var target = Vector2()
var velocity = Vector2()

func _unhandled_input(event):
	if event.is_action_pressed("left_click"):
		moving = true
		target = get_global_mouse_position()
	
func _physics_process(delta):
	MovementLoop(delta)	
	
func MovementLoop(delta):
	if moving == false:
		speed = 0
	else: 
		speed += acceleration * delta
		if speed > max_speed:
			speed = max_speed	
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
	else: 
		moving = false	

	
	
	
	
	
	
	
	
	
	
	
	
	
	#if event.is_action_pressed("left_click"):
	#	target = get_global_mouse_position()

	#velocity = (target - position).normalized() * speed
	#if (target - position).length() > 5:
	#	velocity = move_and_slide(velocity)
	#if Input.is_action_pressed("left_click"):
	#	move_and_slide(get_global_mouse_position())
