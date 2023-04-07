extends Node2D

func _ready():
	var newshop = preload("res://shop_object.tscn").instantiate()
	newshop.interface = $CanvasLayer/Interface
	newshop.position = Vector2(130,165)
	newshop.color = Color(0,1,0)
	newshop.nameOfUpgrade = "Move Speed"
	newshop.var_to_change = 1
	self.add_child(newshop)
