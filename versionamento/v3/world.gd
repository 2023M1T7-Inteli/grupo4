extends Node2D
#preload control scene
var preloadMensagem = preload("res://tela inicial completa/Control.tscn").instance()


func _on_placaTutorial_body_entered(body):
# invoke a floating scene when entering the collision area
	get_tree().current_scene.add_child(preloadMensagem)
	
func _on_placaTutorial_body_exited(body):
#remove the floating scene where you exit the collision area
	get_tree().current_scene.remove_child(preloadMensagem)
	
func _on_PlacaFase1_body_entered(body):
# change scene to mapa scene
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")
