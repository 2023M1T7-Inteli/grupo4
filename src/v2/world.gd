extends Node2D
#precarrega uma cena.
var preloadMensagem = preload("res://tela inicial completa/Control.tscn").instance()


func _on_placaTutorial_body_entered(body):
	#chama uma cena flutuante ao entrar na área de colisão
	get_tree().current_scene.add_child(preloadMensagem)
	
func _on_placaTutorial_body_exited(body):
	#remove a cena flutuante aonde sair da área de colisão
	get_tree().current_scene.remove_child(preloadMensagem)
	



func _on_PlacaFase1_body_entered(body):
	#cena que contem o texto.
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")
