extends Area2D

var playerRef #Está variavel é usada para armazenar uma referência ao jogador
var x = false#Essa variavel será usada para verificar se o jogador está colidindo com o bau
var isOpen = false#Essa variavel será usada para verificar se o bau está aberto ou fechado
var resultado

func _on_bau_body_entered(body):
	#Está é uma função de detecção de colisão. é chamada quando um objeto entra na área do bau
	#print(body)
	x = true
#
	if body.is_in_group('Player'):
		playerRef = body
		x = true
	
func _on_bau_body_exited(body):
	#Está é uma função de detecção de colisão. é chamada quando um objeto sai na área do bau
	x = false
	if body.is_in_group('player'):
		playerRef = null
		x = false
		
func _ready():
	$AnimatedSprite.animation = 'fechado'
	
func switchChest():
	#Está função que alternará entre abrir e fechar o baú
	if (isOpen == true):
		$AnimatedSprite.animation = 'fechado'
		isOpen = false
	elif (isOpen == false):
		$AnimatedSprite.animation = 'aberto'
		isOpen = true
	
func _process(delta) -> void:
	#Está função verifica se a ação "ui_accpet" foi precionada e se "x" é true. Se ambos forem verdadeiros, alternar entre abrir e fechar o baú
	if Input.is_action_just_pressed("ui_accept") and x:
		$CanvasLayer.visible = true
	if $CanvasLayer/ContaSoma.resp == 1 or $CanvasLayer/ContaSoma.resp == 0:
		$CanvasLayer.visible = false
		
	#	if x == true:
	#		switchChest()
			

	
