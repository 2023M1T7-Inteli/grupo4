extends Control

func _ready():
	#focus on the start button
	$controls/startBtn.grab_focus()

func _on_startBtn_pressed():
# change scene to the main map
	get_tree().change_scene("res://HUB.tscn")

func _on_controlsBtn_pressed():
# change scene to the settings scene
	var controlScreen = load("res://tela inicial completa/controlsScreen.tscn").instance()
	get_tree().current_scene.add_child(controlScreen)


func _on_quitBtn_pressed():
#quit the game
	get_tree().quit()
	
