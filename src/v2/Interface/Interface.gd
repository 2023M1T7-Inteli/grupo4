extends CanvasLayer

var touch_left = false
var touch_right = false
var touch_up = false
var touch_down = false

func _ready():
	pass # Replace with function body.

func _on_Left_pressed():
	touch_left = true

func _on_Left_released():
	touch_left = false

func _on_Right_pressed():
	touch_right = true

func _on_Right_released():
	touch_right = false

func _on_Up_pressed():
	touch_up = true
	
func _on_Up_released():
	touch_up = false

func _on_Down_pressed():
	touch_down = true

func _on_Down_released():
	touch_down = false
