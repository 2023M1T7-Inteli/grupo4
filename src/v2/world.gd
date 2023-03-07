extends Node2D
#precarrega uma cena.
var preloadMensagem = preload("res://Control.tscn").instance()

func _on_Area2D_body_entered(body):
	#chama uma cena flutuante
	get_tree().current_scene.add_child(preloadMensagem)
	
func _on_Area2D_body_exited(body):
	get_tree().current_scene.remove_child(preloadMensagem)
