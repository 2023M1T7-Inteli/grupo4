extends Area2D

var playerRef #This variable is used to store a reference to the player
var x = false#This variable will be used to check if the player is colliding with the trunk
var isOpen = false#This variable will be used to check if the trunk is open or closed
var resultado

func _on_bau_body_entered(body):
	#This is a collision detection function. is called when an object enters the trunk area
	x = true
#
	if body.is_in_group('Player'):
		playerRef = body
		x = true
	
func _on_bau_body_exited(body):#This is a collision detection function. is called when an object leaves the trunk area
	x = false
	if body.is_in_group('player'):
		playerRef = null
		x = false
		
func _ready():
	$AnimatedSprite.animation = 'fechado'
	
func switchChest(): #This function will alternate between opening and closing the trunk
	if (isOpen == true):
		$AnimatedSprite.animation = 'fechado'
		isOpen = false
	elif (isOpen == false):
		$AnimatedSprite.animation = 'aberto'
		isOpen = true
	
func _process(delta) -> void: #This function checks if the action "ui_accpet" was pressed and if "x" is true. If both are true, toggle between opening and closing the trunk
	if Input.is_action_just_pressed("ui_accept") and x:
		$CanvasLayer.visible = true
	if $CanvasLayer/ContaSoma.resp == 1 or $CanvasLayer/ContaSoma.resp == 0:
		$CanvasLayer.visible = false
		
func contaMat(x,s,y,a): #creates a function to the math accounts on the trunk; x and s are values; y is a operator; a is the wrong answer
	$CanvasLayer/ContaSoma/Label2.text = "Quanto é " + str(x) + s + str(y)
	$CanvasLayer/ContaSoma/controls/Resposta1.text = str(x)
	$CanvasLayer/ContaSoma/controls2/Resposta2.text = str(a)
	if s == "+":
		resultado = x + y
	elif s == "-":
		resultado = x - y
	elif s == "x":
		resultado = x*y
	elif s == "/":
		resultado = x/y
	else:
		resultado = "Inválido"
	$CanvasLayer/ContaSoma/controls/Resposta1.text = str(resultado)
