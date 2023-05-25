extends Control

func _ready():
	$controls/startBtn.grab_focus()


func _on_startBtn_pressed():
	get_tree().change_scene("res://tela inicial 1/level_01.tscn")
	
func _on_settingsButton_pressed():
	var settingsScreen = load("res://tela inicial 1/settings.tscn").instance()
	get_tree().current_scene.add_child(settingsScreen)

#nessa funcão, quando o botão for precionado, a pagina do jogo fecha
func _on_quitButton_pressed():
	get_tree().quit()
