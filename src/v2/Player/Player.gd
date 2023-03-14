extends KinematicBody2D

onready var touch_down = get_node("/root/Controls").touch_down
onready var touch_up = get_node("/root/Controls").touch_up
onready var touch_right = get_node("/root/Controls").touch_right
onready var touch_left = get_node("/root/Controls").touch_left

func _physics_process(delta):
	#player speed
	var vectorMovement = Vector2.ZERO
	#Define player direction
	vectorMovement.x =Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vectorMovement.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#change the animation while change the player direction
	if(Input.is_action_pressed("ui_right") or touch_right):
		$AnimationPlayer.play("direita")
	elif(Input.is_action_pressed("ui_left") or touch_left):
		print('ok')
		$AnimationPlayer.play("esquerda")
	elif(Input.is_action_pressed("ui_down") or touch_down):
		$AnimationPlayer.play("baixo")
	elif(Input.is_action_pressed("ui_up") or touch_up):
		$AnimationPlayer.play("cima")
	else:
		#stop the player
		$AnimationPlayer.stop()
		#Move the player
	move_and_slide(vectorMovement*50)
	

