extends KinematicBody2D

var speed = 100 # speed in pixels/sec

var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$Sprite.rotation_degrees = 270
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$Sprite.rotation_degrees = 90
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		$Sprite.rotation_degrees = 360
		
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		$Sprite.rotation_degrees = 180
	if Input.is_action_just_pressed("Fight"):
		$Sprite/SchwertMove.visible = true
		$Sprite/SchwertMove.play()
		
		
		
	# Make sure diagonal movement isn't faster

	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

#end me

func _on_AnimatedSprite_animation_finished():
	$Sprite/SchwertMove.stop()
	$Sprite/SchwertMove.visible = false
	


