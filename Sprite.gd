extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Page = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#Testing Dialogsystem
func _on_Button_pressed():
	
	var Dialog = ["You should go see her.", "Still can't remember\n where she lives?", "Just head east and\n stay on the path."]
	
	if Page == 0:
		print(Dialog[0])
		$Label.text = Dialog[0]
		
	
	elif Page == 1:
		print(Dialog[1])
		$Label.text = Dialog[1]
		
	
	elif Page == 2:
		print(Dialog[2])
		$Label.text = Dialog[2]
		$Button/KeepReading.visible = false
	else:
		pass
	
	Page = Page + 1



func _on_Area2D_body_entered(body):
	visible = true


func _on_Area2D_body_exited(body):
	visible = false
