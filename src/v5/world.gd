extends Node2D

var casx1 = false
var casx2 = false
var casx3 = false
var casx4 = false
var casx5 = false
var cas1 = false
var cas2 = false
var cas3 = false
var cas4 = false
var cas5 = false
var startx = false
#preload control scene
var preloadMensagem = preload("res://tela inicial completa/Control.tscn").instance()

var newDialog = Dialogic 

func _ready() -> void:
	#quando entra no jogo incia o Dialogo.
	add_child(newDialog.start('Inicio'))
		
func _on_casinha1_body_entered(body):
	casx1 = true

func _on_casinha1_body_exited(body):
	casx1 = false
	
func _on_casinha2_body_entered(body):
	casx2 = true
	
func _on_casinha2_body_exited(body):
	casx2 = false
	
func _on_casinha3_body_entered(body):
	casx3 = true

func _on_casinha3_body_exited(body):
	casx3 = false

func _on_casinha4_body_entered(body):
	casx4 = true

func _on_casinha4_body_exited(body):
	casx4 = false

func _on_casinha5_body_entered(body):
	casx5 = true


func _on_casinha5_body_exited(body):
	casx5 = false
	
func _process(delta):
	
	if startx == true and Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")
		
	if casx5 == true and Input.is_action_just_pressed("ui_accept"):
		cas5 = true
		
	if casx4 == true and Input.is_action_just_pressed("ui_accept"):
		cas4 = true
	
	if casx3 == true and Input.is_action_just_pressed("ui_accept"):
		cas3 = true
		
	if casx2 == true and Input.is_action_just_pressed("ui_accept"):
		cas2 = true
		
	if casx1 == true and Input.is_action_just_pressed("ui_accept"):
		cas1 = true
	
	if newDialog.has_current_dialog_node() == true:
		get_node("Player").moving = false
	else:
		get_node("Player").moving = true
		
	for i in range(1,5):
		var minigame = get_node("bau"+str(i)+"/CanvasLayer/ContaSoma")
		
		if i==1:
			minigame.contaMat(1,"+",2,4)
		elif i==2:
			minigame.contaMat(3,"-",2, 3)
		elif i==3:
			minigame.contaMat(4,"x",3, 10)
		elif i==4:
			minigame.contaMat(4,"/",2, 8)
		
		if get_node("bau"+str(i)+"/CanvasLayer").visible == true:
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
	startx = true

func _on_Npc1Colision_body_entered(body):
	add_child(newDialog.start('Npc1'))
	
func _on_Area2D_body_entered(body):
	add_child(newDialog.start('Npc3'))

func _on_PlacaFase1_body_exited(body):
	startx = false
