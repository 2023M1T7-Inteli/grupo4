extends Node2D

var x = false
var i = false

func _on_Area2D_body_entered(body):
	x = true

func _on_Area2D_body_exited(body):
	x = false

func _process(delta):
	if x == true and Input.is_action_just_pressed("ui_accept"):
		i = true
