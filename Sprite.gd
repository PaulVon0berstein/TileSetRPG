extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Testing Dialogsystem
func _on_Button_pressed():
	var FirstText = true
	var SecondTest = false
	var ThirdText = false
	
	if FirstText == true:
		$Label.text = "You should go see her."
		SecondTest = true
		FirstText = false
	else:
		pass
	if SecondTest == true:
		$Label.text = "Still can't remember\n where she lives?"
		ThirdText = true
		SecondTest = false
	else:
		pass
	if ThirdText == true:
		$Label.text = "Just head east and\n stay on the path."
		
	


func _on_Area2D_body_entered(body):
	visible = true
