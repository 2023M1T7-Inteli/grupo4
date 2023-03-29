extends Node2D

var i = false
var x = false
var start = false

func _ready():
	ScreenTransition.get_child(0).get_child(0).play("transition_in")
	
func _on_saidaCasinha1_body_entered(body):
#Está função deixa a variavel x true para que quando aperte enter mude a cena.
	x = true
	
func _on_saidaCasinha1_body_exited(body):
#Está função deixa a variavel x para impossibilitar de mudar a cena.
	x = false
	start == true
	ScreenTransition.get_child(0).get_child(0).play("transition_out")
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://HUB.tscn")
	start == false
func _process(delta):
#Está função com que com que a varialvel i fique verdade fazendo com que a cena seja trocada.
	if x == true and Input.is_action_just_pressed("ui_accept"):
		i = true
		

	



