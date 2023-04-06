extends Node2D

var finishedRun = false
var status = 'none'
var newDialog = Dialogic

var HUD = load("res://Puzzle/Interface/Gerenciador/HUD.tscn").instance()

func _ready():
	ScreenTransition.get_child(0).get_child(0).play("transition_in")
	HUD.continues = 2
	add_child(HUD)
	
# Change scene to world scene when the texture button is pressed
func _on_TextureButton_pressed():
	get_tree().change_scene("res://HUB.tscn")

# Change scene to loser scene when the Area2D body enter the respective colision
func _on_Area2D_body_entered(body):
	status = 'lost'
	# Instantiate the loser scene and set its variables
	var winnerScene = load("res://Puzzle/Interface/Scenes/LoserScene/loserScene.tscn").instance()
	winnerScene.next_phase = 4
	winnerScene.current_phase = 3
	get_tree().current_scene.add_child(winnerScene)
	get_node("HUD").resetList() # Reset the comands list when the player lose the game or reset it
	
# Change scene to winner scene when the Area2D body enter the respective colision
func _on_vitoria_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Global.pontos += 10
	status = 'won'
	
	# Instantiate the winner scene and set its variables
	var winnerScene = load("res://Puzzle/Interface/Scenes/EndingScene/endingScene.tscn").instance()
	
	# Removes the player from the tree
	get_tree().current_scene.remove_child($Player)
	
	# Add the winner scene to the tree
	get_tree().current_scene.add_child(winnerScene)
	

# When player has finished his run
func _on_Player_finishedRun():
	# Wait player to complete his last action
	yield(get_tree().create_timer(1.5), "timeout")
	# Then check if status is equal to none
	if status == 'none':
		# If it is, load the loserScene and add it to the tree
		var loserScene = load("res://Puzzle/Interface/Scenes/LoserScene/loserScene.tscn").instance()
		loserScene.next_phase = 4
		loserScene.current_phase = 3
		get_tree().current_scene.add_child(loserScene)

func subtractContinues():
	get_node("/root/Global").current_amount_of_continues -= 1
	$HUD/PlaysLeft.text = String(get_node("/root/Global").current_amount_of_continues)
	
