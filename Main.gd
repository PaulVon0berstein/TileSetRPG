extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	print("uwu")
	$Area2D/BubbleAlia.visible = true
	$Area2D/BubbleAlia/Label/LabelTimer.start()
	
	





func _on_LabelTimer_timeout():
	$Area2D/BubbleAlia.visible = false
	$alia.visible = false
	$Area2D.queue_free()



