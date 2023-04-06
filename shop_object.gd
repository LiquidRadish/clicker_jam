extends Sprite2D

@export var interface: Control
@export var cost = 3
@export var nameOfUpgrade = "Upgrade Test"


var destroying = 0;
var entered = false

func _on_hitbox_body_entered(body):
	entered = true
	var label:Label = interface.get_child(1)
	if label != null:
		label.text = "Press Enter to Buy: \n" + nameOfUpgrade + " for " + str(cost) + " clicks"


func _on_hitbox_body_exited(body):
	entered = false
	var label:Label = interface.get_child(1)
	if label != null:
		label.text = ""
	
func _process(delta):
	if destroying != 0:
		position.y += -0.5
		destroying+=1
		if destroying >= 20:
			queue_free()
	elif entered:
		var label:Label = interface.get_child(1)
		if label != null && Input.is_action_just_pressed("ui_accept"):
			if GlobalVariables.click_count >= cost:
				GlobalVariables.click_count-= cost
				GlobalVariables.jump_speed += 20
				label.text = ""
				destroying = 1
			else:
				label.text = "Too expensive"
