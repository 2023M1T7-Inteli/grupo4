extends Control

func _ready():
	$returnButton.grab_focus()

func _on_returnButton_pressed():
	queue_free()
