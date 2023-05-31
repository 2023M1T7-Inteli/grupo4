extends Control

func _ready():
	$returnButton.grab_focus()


func _on_returnButton_pressed():
	queue_free()
	get_tree().change_scene("res://tela inicial 1/startScreen.tscn")
	
	
