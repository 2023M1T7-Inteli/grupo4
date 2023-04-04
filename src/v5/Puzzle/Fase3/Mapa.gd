extends Node2D

var finishedRun = false
var status = 'none'
var newDialog = Dialogic

var HUD = load("res://Puzzle/Interface/Gerenciador/HUD.tscn").instance()

func _ready():
	ScreenTransition.get_child(0).get_child(0).play("transition_in")
#	add_child(newDialog.start('Npc2'))
	HUD.continues = 2
	add_child(HUD)
	
#change scene to world scene when the texture button is pressed
func _on_TextureButton_pressed():
	get_tree().change_scene("res://HUB.tscn")

#change scene to loser scene when the Area2D body enter the respective colision
func _on_Area2D_body_entered(body):
	status = 'lost'
	var winnerScene = load("res://Puzzle/Interface/Scenes/LoserScene/loserScene.tscn").instance()
	winnerScene.next_phase = 4
	winnerScene.current_phase = 3
	get_tree().current_scene.add_child(winnerScene)
	get_node("HUD").resetList() #reset the comands list when the player lose the game or reset it
	
#change scene to winner scene when the Area2D body enter the respective colision
func _on_vitoria_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Global.pontos += 10
	status = 'won'
	var winnerScene = load("res://Puzzle/Interface/Scenes/WinnerScene/winnerScene.tscn").instance()
	winnerScene.next_phase = 4
	winnerScene.current_phase = 3
	
	get_tree().current_scene.remove_child($Player)
	get_tree().current_scene.add_child(winnerScene)
	get_node("HUD").resetList()  # change the scene to the winner scene
	

func _on_Player_finishedRun():
	if status == 'none':
		var winnerScene = load("res://winner & loser bgd/LoserScene.tscn").instance()
		get_tree().current_scene.add_child(winnerScene)

func subtractContinues():
	get_node("/root/Global").current_amount_of_continues -= 1
	$HUD/PlaysLeft.text = String(get_node("/root/Global").current_amount_of_continues)
	
