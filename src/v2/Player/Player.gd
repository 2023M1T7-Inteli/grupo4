extends KinematicBody2D

func _physics_process(delta):
	#Velocidade do jogador
	var vectorMovement = Vector2.ZERO
	#Definir a direção do personagem
	vectorMovement.x =Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vectorMovement.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#Muda a animação conforme a direção do personagem muda
	if(Input.is_action_pressed("ui_right")):
		$AnimationPlayer.play("direita")
	elif(Input.is_action_pressed("ui_left")):
		$AnimationPlayer.play("esquerda")
	elif(Input.is_action_pressed("ui_down")):
		$AnimationPlayer.play("baixo")
	elif(Input.is_action_pressed("ui_up")):
		$AnimationPlayer.play("cima")
	else:
		#Para o personagem
		$AnimationPlayer.stop()
		#Movimenta o personagem
	move_and_slide(vectorMovement*50)
	

