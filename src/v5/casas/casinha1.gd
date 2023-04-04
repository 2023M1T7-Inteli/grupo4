extends Node2D

var x = false
var i = false
var newDialog = Dialogic 

func _on_saidaCasinha1_body_entered(body):
#Está função deixa a variavel x true para que quando aperte enter mude a cena.
	x = true
	
func _on_saidaCasinha1_body_exited(body):
#Está função deixa a variavel x para impossibilitar de mudar a cena.
	x = false
	
func _process(delta):
	if newDialog.has_current_dialog_node() == true:
		get_node("Player").moving = false
		self.pause_mode= Node.PAUSE_MODE_STOP
	else:
		get_node("Player").moving = true
		self.pause_mode= Node.PAUSE_MODE_INHERIT
#Está função com que com que a varialvel i fique verdade fazendo com que a cena seja trocada.
	if x == true and Input.is_action_just_pressed("ui_accept"):
		i = true
		
func _on_Npc4_body_entered(body):
	add_child(newDialog.start('Npc4'))

