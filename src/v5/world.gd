extends Node2D
# Variables to check if the character is close to the houses
var casx1 = false
var casx2 = false
var casx3 = false
var casx4 = false
var casx5 = false
# Variables to check if the character interacted with the houses
var cas1 = false
var cas2 = false
var cas3 = false
var cas4 = false
var cas5 = false
# Variable to check if the transition scene has started
var start = false
# Preload the floating message scene
var preloadMensagem = preload("res://tela inicial completa/Control.tscn").instance()
# Dialogic node instance
var newDialog = Dialogic 

func _ready() -> void:
# when you enter the game, start the Dialog.
	add_child(newDialog.start('Inicio'))
# Functions to detect the entry and exit of the character in the areas of the houses
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
# Function to process the character's interactions with the boxes and dialogues
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
	 # Check if there is a dialogue in progress, if there is, disable player movement
		get_node("Player").moving = false
	else:
		get_node("Player").moving = true
		
	for i in range(1,5):
		# Loop to configure the minigames for each chest
		var minigame = get_node("bau"+str(i)+"/CanvasLayer/ContaSoma")
		
		if i==1:
			minigame.contaMat(20,"+",6,26)
		elif i==2:
			minigame.contaMat(10,"-",2, 8)
		elif i==3:
			minigame.contaMat(6,"x",8, 48)
		elif i==4:
			minigame.contaMat(20,"/",4, 5)
		
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
	start == true
	ScreenTransition.get_child(0).get_child(0).play("transition_out")
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")
	start == false

func _on_Npc1Colision_body_entered(body):
	add_child(newDialog.start('Npc1'))
	
func _on_Area2D_body_entered(body):
	add_child(newDialog.start('Npc3'))

