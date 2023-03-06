extends Area2D

var playerRef
var x = false
var isOpen = false

func _on_bau_body_entered(body):
	print(body)
	x = true
	if body.is_in_group('Player'):
		playerRef = body
		x = true
	
func _on_bau_body_exited(body):
	x = false
	if body.is_in_group('player'):
		playerRef = null
		x = false
		
func _ready():
	$AnimatedSprite.animation = 'fechado'
	
func switchChest():
	if (isOpen == true):
		$AnimatedSprite.animation = 'fechado'
		isOpen = false
	elif (isOpen == false):
		$AnimatedSprite.animation = 'aberto'
		isOpen = true
	
func _process(delta) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if x == true:
			switchChest()





