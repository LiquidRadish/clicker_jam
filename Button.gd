extends TextureButton

func _ready():
	self.pressed.connect(self._button_pressed)
	
func _button_pressed():
	GlobalVariables.click_count +=1;
