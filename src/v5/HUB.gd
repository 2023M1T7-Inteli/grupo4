extends Node2D

func _ready():
	$casinha1/Player/Camera2D.current = false
	$world/Player/Camera2D.current = true
	$casinha1/Player/Camera2D.limit_left = 694
	$casinha1/Player/Camera2D.limit_top = 30
	$casinha1/Player/Camera2D.limit_right = 998
	$casinha1/Player/Camera2D.limit_bottom = 206
	$casinha2/Player/Camera2D.limit_left = 16
	$casinha2/Player/Camera2D.limit_top = -288
	$casinha2/Player/Camera2D.limit_right = 314
	$casinha2/Player/Camera2D.limit_bottom = -108
	
func _process(delta):
	if $world.cas1:
		$world/Player/Camera2D.current = false
		$world.pause_mode = Node.PAUSE_MODE_STOP
		$casinha1.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha1/Player.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha1/Player.position = Vector2(15,6)
		$casinha1/Player/Camera2D.current = true
		$world.cas1 = false
		
	if $world.cas2:
		$world/Player/Camera2D.current = false
		$world.pause_mode = Node.PAUSE_MODE_STOP
		$casinha2.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha2/Player.pause_mode = Node.PAUSE_MODE_INHERIT
		$casinha2/Player.position = Vector2(9,67)
		$casinha2/Player/Camera2D.current = true
		$world.cas2 = false
	
	for a in range(1,2):
		if get_node("casinha"+str(a)).i:
				get_node("casinha"+str(a)+"/Player/Camera2D").current = false
				$world.pause_mode = Node.PAUSE_MODE_INHERIT
				get_node("casinha"+str(a)).pause_mode = Node.PAUSE_MODE_STOP
				$world/Player.position = Vector2(-23,-31)
				$world/Player/Camera2D.current = true
				get_node("casinha"+str(a)).i = false
