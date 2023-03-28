extends Node2D

var i = false
var x = false


func _on_saidaCasinha1_body_entered(body):
#Está função deixa a variavel x true para que quando aperte enter mude a cena.
	x = true
	
func _on_saidaCasinha1_body_exited(body):
#Está função deixa a variavel x para impossibilitar de mudar a cena.
	x = false
	
func _process(delta):
#Está função com que com que a varialvel i fique verdade fazendo com que a cena seja trocada.
	if x == true and Input.is_action_just_pressed("ui_accept"):
		i = true
		

	



