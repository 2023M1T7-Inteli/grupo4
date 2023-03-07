extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	var obj = node.
	print('abc')
	pass # Replace with function body.

# Adiciona task
func addTask(task):
	get_parent().get_node("GerenciadorDeBlocos")._addTask(task)

func _on_RotateCounter_pressed():
	addTask('rotate_counter')

func _on_WalkButton_pressed():
	addTask('walk')

func _on_Rotate_pressed():
	addTask('rotate')

func _on_Close_pressed():
	visible = false
	pass
