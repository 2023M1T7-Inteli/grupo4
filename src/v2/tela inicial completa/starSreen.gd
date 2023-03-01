extends Control

func _ready():
	#Foca no primeiro botão
	$controls/startBtn.grab_focus()


func _on_startBtn_pressed():
	#Muda a cena para o mapa principal
	get_tree().change_scene("res://world.tscn")

func _on_controlsBtn_pressed():
	#Muda a cena para configurções 
	var controlScreen = load("res://tela inicial completa/controlsScreen.tscn").instance()
	get_tree().current_scene.add_child(controlScreen)


func _on_quitBtn_pressed():
	#Fecha o jogo
	get_tree().quit()
	
