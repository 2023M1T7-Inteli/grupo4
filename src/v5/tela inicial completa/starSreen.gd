extends Control

var start = false

func _ready():
	#focus on the start button
	$controls/startBtn.grab_focus()
	#transition.material.set_shader_param("type", transition_type)
	#animation.playback_speed= duration
	
func _unhandled_input(event):
	if Input.is_action_pressed("ui_accept") or start == true:
		start = false
		ScreenTransition.get_child(0).get_child(0).play("transition_out")
		yield(get_tree().create_timer(1),"timeout")
		changeScene()
		
	
func changeScene():
	get_tree().change_scene("res://HUB.tscn")
	print("oi")
	
func _on_startBtn_pressed():
	start = true

func _on_controlsBtn_pressed():
# change scene to the settings scene
	var controlScreen = load("res://tela inicial completa/controlsScreen.tscn").instance()
	get_tree().current_scene.add_child(controlScreen)


func _on_quitBtn_pressed():
#quit the game
	get_tree().quit()
	
