extends Node2D
#precarrega uma cena.
var preloadMensagem = preload("res://tela inicial completa/Control.tscn").instance()


func _on_placaTutorial_body_entered(body):
	#chama uma cena flutuante
	get_tree().current_scene.add_child(preloadMensagem)
	
func _on_placaTutorial_body_exited(body):
	get_tree().current_scene.remove_child(preloadMensagem)
	



func _on_PlacaFase1_body_entered(body):
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")
