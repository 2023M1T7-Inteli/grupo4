extends CanvasLayer

export(int) var next_phase
export(int) var current_phase

func _ready():
	# Verifies if the next phases is 4, which doesnt exist and indicates that player is on the last phase
	if (next_phase == 4):
		$Label.text = 'Você errou um comando :( \n \n Tente novamente para finalizar \n sua alaventura!'
	else:
		# Standard message
		$Label.text = 'Você errou um comando :( \n \n Tente novamente para seguir\n para a fase ' + String(next_phase)
	$btnRestart.text = "Reiniciar fase " + String(current_phase)
	pass 
# change scene to maps scene
func _on_btnRestart_pressed():
	get_node("/root/Global").tasks = []
	get_node("/root/Global").loadPhase()
	get_tree().change_scene("res://Puzzle/Fase" + String(current_phase) + "/Mapa.tscn")

# change scene to world scene
func _on_btnMap_pressed():
	get_tree().change_scene("res://HUB.tscn")
