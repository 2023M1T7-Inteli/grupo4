extends Node2D

var x = false
var i = false
var newDialog = Dialogic 

func _on_saida2_body_entered(body):
	x = true

func _on_saida2_body_exited(body):
	x = false

func _process(delta):
	if newDialog.has_current_dialog_node() == true:
		get_node("Player").moving = false
		self.pause_mode= Node.PAUSE_MODE_STOP
	else:
		get_node("Player").moving = true
		self.pause_mode= Node.PAUSE_MODE_INHERIT
	if x == true and Input.is_action_just_pressed("ui_accept"):
		i = true

func _on_Npc5_body_entered(body):
	add_child(newDialog.start('Npc5'))
