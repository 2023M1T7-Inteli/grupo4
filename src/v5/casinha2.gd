extends Node2D

var x = false
var i = false
var start = false

func _ready():
	ScreenTransition.get_child(0).get_child(0).play("transition_in")

func _on_saida2_body_entered(body):
	x = true

func _on_saida2_body_exited(body):
	x = false
	start == true
	ScreenTransition.get_child(0).get_child(0).play("transition_out")
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://HUB.tscn")
	start == false

func _process(delta):
	if x == true and Input.is_action_just_pressed("ui_accept"):
		i = true
