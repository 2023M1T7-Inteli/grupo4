extends CanvasLayer


func _ready():
	pass 
# change scene to maps scene
func _on_btnRestart_pressed():
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")

# change scene to word scene
func _on_btnMap_pressed():
	get_tree().change_scene("res://world.tscn")
