extends CanvasLayer

func _ready():
	pass
	# change scene to Mapa scene
func _on_btnRestart_pressed():
	get_node('/root/Global').tasks = []
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")

	# change scene to Fase2 scene
func _on_btnF2_pressed():
	get_tree().change_scene("res://winner & loser bgd/Fase2.tscn")

	# change scene to World scene
func _on_btnMap_pressed():
	get_tree().change_scene("res://HUB.tscn")
