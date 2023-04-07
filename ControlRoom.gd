extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	# Istantiates two upgrade nodes and sets their position
	var items = [preload("res://shop_object.tscn").instantiate(), preload("res://shop_object.tscn").instantiate()]
	items[0].position = Vector2(100,170)
	items[1].position = Vector2(140,170)
	
	# Randomly chooses the upgrade's type and adds it to the scene
	for item in items:
		item.interface = $CanvasLayer/Interface
		match rng.randi_range(0,1):
			0:
				item.color = Color(0,0,1)
				item.nameOfUpgrade = "Jump Height"
				item.var_to_change = 0
			1:
				item.color = Color(0,1,0)
				item.nameOfUpgrade = "Move Speed"
				item.var_to_change = 1
		self.add_child(item)
