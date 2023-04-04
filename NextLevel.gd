extends Sprite2D

var entered = false

func _on_hitbox_body_entered(body):
	entered = true
		


func _on_hitbox_body_exited(body):
	entered = false
	
func _process(delta):
	if entered:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene_to_file("res://Levels/ControlRoom.tscn")
