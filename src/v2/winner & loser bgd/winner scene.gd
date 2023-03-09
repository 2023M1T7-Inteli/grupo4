extends CanvasLayer

func _ready():
	pass
	
func _on_btnRestart_pressed():
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")

func _on_btnF2_pressed():
	get_tree().change_scene("res://winner & loser bgd/Fase2.tscn")

func _on_btnMap_pressed():
	get_tree().change_scene("res://world.tscn")
