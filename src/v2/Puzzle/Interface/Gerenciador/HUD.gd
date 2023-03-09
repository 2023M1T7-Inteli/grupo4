extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Arrow_pressed():
	pass

func _on_ArrowDown_pressed():
	print('c')
	$TextureRect/AnimationPlayer.clear_queue()
	$TextureRect/AnimationPlayer.current_animation = 'slide_down'
	$TextureRect/AnimationPlayer.play()
	pass


func _on_Play_pressed():
	get_node('/root/Global').start()
	pass # Replace with function body.

# Reseta todas as tasks
func resetList():
	get_node("/root/Global").resetList()
