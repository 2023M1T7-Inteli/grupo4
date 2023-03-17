extends Node2D

#preload control scene
var preloadMensagem = preload("res://tela inicial completa/Control.tscn").instance()

func _ready() -> void:
	#quando entra no jogo incia o Dialogo.
	var newDialog = Dialogic.start('Inicio')
	add_child(newDialog)

func _process(delta):
	for i in range(1,5):
		var minigame = get_node("bau"+str(i))
		
		if minigame == get_node("bau1"):
			minigame.contaMat(1,"+",2)
		elif minigame == get_node("bau2"):
			minigame.contaMat(3,"-",2)
		elif minigame == get_node("bau3"):
			minigame.contaMat(4,"x",3)
		elif minigame == get_node("bau4"):
			minigame.contaMat(4,"/",2)
		
		if minigame.x == true:
			self.pause_mode= Node.PAUSE_MODE_STOP
		else:
			self.pause_mode= Node.PAUSE_MODE_INHERIT
			
func _on_placaTutorial_body_entered(body):
# invoke a floating scene when entering the collision area
	get_tree().current_scene.add_child(preloadMensagem)
	
func _on_placaTutorial_body_exited(body):
#remove the floating scene where you exit the collision area
	get_tree().current_scene.remove_child(preloadMensagem)
	
func _on_PlacaFase1_body_entered(body):
# change scene to mapa scene
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")


	
