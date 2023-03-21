extends Node2D

func _ready():
	pass
#change scene to world scene when the texture button is pressed
func _on_TextureButton_pressed():
	get_tree().change_scene("res://world.tscn")

#change scene to loser scene when the Area2D body enter the respective colision
func _on_Area2D_body_entered(body):
	var winnerScene = load("res://winner & loser bgd/LoserScene.tscn").instance()
	get_tree().current_scene.add_child(winnerScene)
	get_node("HUD").resetList() #reset the comands list when the player lose the game or reset it
	
#change scene to winner scene when the Area2D body enter the respective colision
func _on_vitoria_body_entered(body):
	var winnerScene = load("res://winner & loser bgd/winner scene.tscn").instance()
	get_tree().current_scene.remove_child($Player)
	get_tree().current_scene.add_child(winnerScene)
	get_node("HUD").resetList()  # change the scene to the winner scene
