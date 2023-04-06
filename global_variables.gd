extends Node

var click_count = 0
var coins = 0

func _process(delta):
	if coins < 0:
		coins = 0;
