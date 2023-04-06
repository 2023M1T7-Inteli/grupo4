extends CanvasLayer

export(int) var next_phase
export(int) var current_phase

func _ready():
	$btnNextPhase.text = "Ir para fase " + String(next_phase)
	$btnRestart.text = "Reiniciar fase " + String(current_phase)
	
	# change scene to Mapa scene
func _on_btnRestart_pressed():
	get_node('/root/Global').tasks = []
	get_tree().change_scene("res://Puzzle/Fase" + String(current_phase) + "/Mapa.tscn")

	# change scene to Fase2 scene
func _on_btnF2_pressed():
	get_node("/root/Global").tasks = []
	get_node("/root/Global").loadPhase()
	get_tree().change_scene("res://Puzzle/Fase" + String(next_phase) + "/Mapa.tscn")

	# change scene to World scene
func _on_btnMap_pressed():
	get_tree().change_scene("res://world.tscn")
