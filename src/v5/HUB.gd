extends Node2D
# Variable to store the number of "casas" in the game.
var nCasas = 6

func _ready():
	# Plays the transition_in animation
	ScreenTransition.get_child(0).get_child(0).play("transition_in")
	 # Initializes Camera2D settings and Player positions for each "casa".
	$casinha1/Player/Camera2D.current = false
	$casinha2/Player/Camera2D.current = false
	$casinha3/Player/Camera2D.current = false
	$casinha4/Player/Camera2D.current = false
	$casinha5/Player/Camera2D.current = false
	$world/Player/Camera2D.current = true
	$casinha1/Player.position = Vector2(1000,1000)
	$casinha2/Player.position = Vector2(1000,1000)
	$casinha3/Player.position = Vector2(1000,1000)
	$casinha4/Player.position = Vector2(1000,1000)
	$casinha5/Player.position = Vector2(1000,1000)
	$casinha1/Player/Camera2D.limit_left = 696
	$casinha1/Player/Camera2D.limit_top = 127
	$casinha1/Player/Camera2D.limit_right = 979
	$casinha1/Player/Camera2D.limit_bottom = 307
	$casinha2/Player/Camera2D.limit_left = 16
	$casinha2/Player/Camera2D.limit_top = -288
	$casinha2/Player/Camera2D.limit_right = 314
	$casinha2/Player/Camera2D.limit_bottom = -108
	$casinha3/Player/Camera2D.limit_left = 11
	$casinha3/Player/Camera2D.limit_top = 362
	$casinha3/Player/Camera2D.limit_right = 309
	$casinha3/Player/Camera2D.limit_bottom = 542
	$casinha4/Player/Camera2D.limit_left = 344
	$casinha4/Player/Camera2D.limit_top = -288
	$casinha4/Player/Camera2D.limit_right = 642
	$casinha4/Player/Camera2D.limit_bottom = -108
	$casinha5/Player/Camera2D.limit_left = 356
	$casinha5/Player/Camera2D.limit_top = 364
	$casinha5/Player/Camera2D.limit_right = 654
	$casinha5/Player/Camera2D.limit_bottom = 544
	
func _process(delta):
	# The following if statements handle the transition into each "casa".
	if $world.cas1:
		ScreenTransition.get_child(0).get_child(0).play("transition_in")
		$world/Player/Camera2D.current = false
		$world.pause_mode = Node.PAUSE_MODE_STOP
		$world/Player.position = Vector2(-1000,-1000)
		$casinha1.pause_mode = Node.PAUSE_MODE_STOP
		$casinha1/Player.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha1/Player.position = Vector2(15,6)
		$casinha1/Player/Camera2D.current = true
		$world.cas1 = false
		
	if $world.cas2:
		ScreenTransition.get_child(0).get_child(0).play("transition_in")
		$world/Player/Camera2D.current = false
		$world.pause_mode = Node.PAUSE_MODE_STOP
		$world/Player.position = Vector2(-1000,-1000)
		$casinha2.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha2/Player.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha2/Player.position = Vector2(9,67)
		$casinha2/Player/Camera2D.current = true
		$world.cas2 = false
		
	if $world.cas3:
		ScreenTransition.get_child(0).get_child(0).play("transition_in")
		$world/Player/Camera2D.current = false
		$world.pause_mode = Node.PAUSE_MODE_STOP
		$world/Player.position = Vector2(-1000,-1000)
		$casinha3.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha3/Player.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha3/Player.position = Vector2(1,61)
		$casinha3/Player/Camera2D.current = true
		$world.cas3 = false
	
	if $world.cas4:
		ScreenTransition.get_child(0).get_child(0).play("transition_in")
		$world/Player/Camera2D.current = false
		$world.pause_mode = Node.PAUSE_MODE_STOP
		$world/Player.position = Vector2(-1000,-1000)
		$casinha4.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha4/Player.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha4/Player.position = Vector2(1,61)
		$casinha4/Player/Camera2D.current = true
		$world.cas4 = false
		
	if $world.cas5:
		ScreenTransition.get_child(0).get_child(0).play("transition_in")
		$world/Player/Camera2D.current = false
		$world.pause_mode = Node.PAUSE_MODE_STOP
		$world/Player.position = Vector2(-1000,-1000)
		$casinha5.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha5/Player.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha5/Player.position = Vector2(1,60)
		$casinha5/Player/Camera2D.current = true
		$world.cas5 = false
		
		
	#quando for aumentado o número de casas é necessario aumentar a variavel nCasas.
	for a in range(1,nCasas):
		if get_node("casinha"+str(a)).i:
			 # Plays the transition_in animation.
				ScreenTransition.get_child(0).get_child(0).play("transition_in")
				# Disables the Camera2D for the current "casa".
				get_node("casinha"+str(a)+"/Player/Camera2D").current = false
				 # Sets pause_mode for the main world and the "casa".
				$world.pause_mode = Node.PAUSE_MODE_INHERIT
				get_node("casinha"+str(a)).pause_mode = Node.PAUSE_MODE_STOP
				 # Updates the Player position based on the "casa" they are leaving.
				if a == 1:
					$world/Player.position = Vector2(-23,-31)
					$casinha1/Player.position = Vector2(1000,1000)
					$casinha2/Player.position = Vector2(1000,1000)
					$casinha3/Player.position = Vector2(1000,1000)
					$casinha4/Player.position = Vector2(1000,1000)
					$casinha5/Player.position = Vector2(1000,1000)
				if a == 2:
					$world/Player.position = Vector2(-46,48)
					$casinha1/Player.position = Vector2(1000,1000)
					$casinha2/Player.position = Vector2(1000,1000)
					$casinha3/Player.position = Vector2(1000,1000)
					$casinha4/Player.position = Vector2(1000,1000)
					$casinha5/Player.position = Vector2(1000,1000)
				if a == 3:
					$world/Player.position = Vector2(219,-5)
					$casinha1/Player.position = Vector2(1000,1000)
					$casinha2/Player.position = Vector2(1000,1000)
					$casinha3/Player.position = Vector2(1000,1000)
					$casinha4/Player.position = Vector2(1000,1000)
					$casinha5/Player.position = Vector2(1000,1000)
				if a == 4:
					$world/Player.position = Vector2(71,-128)
					$casinha1/Player.position = Vector2(1000,1000)
					$casinha2/Player.position = Vector2(1000,1000)
					$casinha3/Player.position = Vector2(1000,1000)
					$casinha4/Player.position = Vector2(1000,1000)
					$casinha5/Player.position = Vector2(1000,1000)
				if a == 5:
					$world/Player.position = Vector2(342,-25)
					$casinha1/Player.position = Vector2(1000,1000)
					$casinha2/Player.position = Vector2(1000,1000)
					$casinha3/Player.position = Vector2(1000,1000)
					$casinha4/Player.position = Vector2(1000,1000)
					$casinha5/Player.position = Vector2(1000,1000)
				# Sets the main world's Camera2D as the current camera.
				$world/Player/Camera2D.current = true
				 # Sets the "casa" transition flag to false.
				get_node("casinha"+str(a)).i = false
