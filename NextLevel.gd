extends Sprite2D

func _ready():
	connect("body_entered", self, "_on_body_entered")
	
func _on_body_entered(body: Area2D) -> void:
	if area.is_in_group("Player"):
		g
