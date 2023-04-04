extends Node2D

var x = false
var i = false
var newDialog = Dialogic 

func _on_saida2_body_entered(body):
	x = true

func _on_saida2_body_exited(body):
	x = false

func _process(delta):
	if x == true and Input.is_action_just_pressed("ui_accept"):
		i = true

func _on_Npc5_body_entered(body):
	add_child(newDialog.start('Npc5'))
