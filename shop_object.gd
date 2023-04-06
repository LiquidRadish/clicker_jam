extends Sprite2D

@export var interface: Control
@export var cost = 3
@export var nameOfUpgrade = "Upgrade Test"

var entered = false

func _on_hitbox_body_entered(body):
	entered = true
	var label:Label = interface.get_child(1)
	if label != null:
		label.text = "Press Enter to Buy: \n" + nameOfUpgrade + " for 3 " + str(cost) + "gold"


func _on_hitbox_body_exited(body):
	entered = false
	var label:Label = interface.get_child(1)
	if label != null:
		label.text = ""
	
func _process(delta):
	if entered:
		var label:Label = interface.get_child(1)
		if label != null && Input.is_action_just_pressed("ui_accept"):
			if GlobalVariables.coins >= cost:
				print("bought")
			else:
				print("Too expensive")
