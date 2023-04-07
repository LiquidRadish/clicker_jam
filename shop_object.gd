extends Sprite2D

@export var interface: Control
@export var cost: int = 3
@export var nameOfUpgrade: String = "Upgrade Test"
@export var color:Color
# variable to change once upgrade is purchased, defined by ints
# 0 = jump height
# 1 = move speed
@export var var_to_change: int = 0

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")


var destroying = 0;
var entered = false

func _ready():
	modulate = color

# When player collides with the object show text display at bottom of the screen
func _on_hitbox_body_entered(body):
	entered = true
	var label:Label = interface.get_child(1)
	if label != null:
		label.text = "Press Enter to Buy: \n" + nameOfUpgrade + " for " + str(cost) + " clicks"

# When player leaves collision get rid of text
func _on_hitbox_body_exited(body):
	entered = false
	var label:Label = interface.get_child(1)
	if label != null:
		label.text = ""
	
func _process(delta):
	
	if destroying == 0 && entered:
		var label:Label = interface.get_child(1)
		if label != null && Input.is_action_just_pressed("ui_accept"):
			
			if GlobalVariables.click_count >= cost:
				#Set texture and animation to coin pickup
				texture = preload("res://assets/images/CoinPickup.png")
				state_machine.travel("Coin Pickup")
				GlobalVariables.click_count-= cost
				
				match var_to_change:
					0:
						GlobalVariables.jump_speed += 20
					1:
						GlobalVariables.move_speed += 20
						
				label.text = ""
				destroying = 1
			else:
				label.text = "Too expensive"

#Destroy object once coin pickup animation is done
func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "Coin Pickup": queue_free()
