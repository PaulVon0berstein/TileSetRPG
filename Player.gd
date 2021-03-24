extends KinematicBody2D

var speed = 100 # speed in pixels/sec

var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$Sprite.visible = false
		$SpriteLeft.visible = false
		$SpriteRight.visible = true
		$SpriteRight.rotation_degrees = 180
		$SpriteUp.visible = false
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$Sprite.visible = false
		$SpriteLeft.visible = true
		$SpriteLeft.rotation_degrees = 180
		$SpriteRight.visible = false
		$SpriteUp.visible = false
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		$Sprite.visible = true
		$Sprite.rotation_degrees = 180
		$SpriteLeft.visible = false
		$SpriteRight.visible = false
		$SpriteUp.visible = false
		
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		$Sprite.visible = false
		$SpriteLeft.visible = false
		$SpriteRight.visible = false
		$SpriteUp.visible = true
		$SpriteUp.rotation_degrees = 180
	if Input.is_action_just_pressed("Fight"):
		$Sprite/SchwertMove.visible = true
		$Sprite/SchwertMove.play()
	if Input.is_action_pressed("Sprint"):
		speed = 200
	if Input.is_action_just_released("Sprint"):
		speed = 100
		
	# Make sure diagonal movement isn't faster

	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

#end me


var hp = 3

var isInSpike = false

func _on_AnimatedSprite_animation_finished():
	$Sprite/SchwertMove.stop()
	$Sprite/SchwertMove.visible = false
	




func _on_PlayerStatsUpdate_timeout():
	
	if hp == 2:
		$Camera2D/HP1.visible = false
	
	if hp == 1:
		$Camera2D/HP3.visible = false
	
	
	if hp <= 0:
		get_tree().change_scene("res://GameOver.tscn")
	else:
		pass


func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	pass




func _on_Area2D_body_entered(body):
	isInSpike = true


func _on_Area2D_body_exited(body):
	isInSpike = false


func _on_Spikes_frame_changed():
	if isInSpike == true:
		hp = hp - 1
	else:
		pass
