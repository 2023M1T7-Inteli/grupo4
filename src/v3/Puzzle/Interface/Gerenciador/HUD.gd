extends CanvasLayer

func _on_Arrow_pressed():
	pass

func _on_ArrowDown_pressed():
	print('c')
	$TextureRect/AnimationPlayer.clear_queue()
	$TextureRect/AnimationPlayer.current_animation = 'slide_down'
	$TextureRect/AnimationPlayer.play()
	pass

# play the game
func _on_Play_pressed():
	get_node('/root/Global').start()
	
# Reset all tasks
func resetList():
	get_node("/root/Global").resetList()

# change scene to maps scene
func _on_returnMap_pressed():
	get_tree().change_scene("res://world.tscn")
