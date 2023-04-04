extends Label

func _process(delta):
	self.text = str(GlobalVariables.click_count) + " Clicks"
