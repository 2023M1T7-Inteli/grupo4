extends KinematicBody2D

onready var interface = get_node("/root/Interface")
var moving = true

func _ready():
	if (interface.has_signal('touch_left')):
		print('has')
		interface.connect("touch_left", self, "pressed")
		print(interface.get_signal_connection_list('touch_left'))

func _physics_process(delta):
	if moving:
		#player speed
		var vectorMovement = Vector2.ZERO
		#Define player direction
		vectorMovement.x =Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		vectorMovement.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		#change the animation while change the player direction
		if(Input.is_action_pressed("ui_right")):
			$AnimationPlayer.play("direita")
		elif(Input.is_action_pressed("ui_left")):
			$AnimationPlayer.play("esquerda")
		elif(Input.is_action_pressed("ui_down")):
			$AnimationPlayer.play("baixo")
		elif(Input.is_action_pressed("ui_up")):
			$AnimationPlayer.play("cima")
		else:
			#stop the player
			$AnimationPlayer.stop()
			#Move the player
		move_and_slide(vectorMovement*50)

func pressed(isIt):
	pass
