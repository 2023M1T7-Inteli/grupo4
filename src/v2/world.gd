extends Node2D
#precarrega uma cena.
var preloadMensagem = preload("res://Control.tscn").instance()

func _on_Area2D_body_entered(body):
	#chama uma cena flutuante
	get_tree().current_scene.add_child(preloadMensagem)
	
func _on_Area2D_body_exited(body):
	get_tree().current_scene.remove_child(preloadMensagem)


func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")
	
	
