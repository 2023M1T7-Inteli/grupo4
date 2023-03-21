extends CanvasLayer

var tasks = []

# Função que deleta todos os nodes filhos do node passado
static func delete_children(node):
	# Loopa pelos filhos do node passado
	for n in node.get_children():
		# Remove o filho da vez
		node.remove_child(n)
		
		# Limpa ele da queue do loop para que não loope por onde não existe filho
		n.queue_free()

# play the game
func _on_Play_pressed():
	get_node('/root/Global').start()
	
# Reset all tasks
func resetList():
	get_node("/root/Global").resetList()

# change scene to maps scene
func _on_returnMap_pressed():
	get_tree().change_scene("res://world.tscn")

func _addTask(task):
	if get_parent().get_node('Player').started:
		return
	# Verifica se o global já ta cheio
	var g = get_node('/root/Global')
	
	if len(g.tasks) < 8:
		# Adiciona task no global
		get_node("/root/Global").addTask(task)
		
		tasks = get_node("/root/Global").tasks
		
		$TextureRect/HBoxContainer.get_child(len(tasks) - 1).updateButton(task)
	
func _on_Turn_pressed():
	_addTask('turn')

func _on_TurnAnti_pressed():
	_addTask('turn_anti')

func _on_Delete_pressed():
	get_node('/root/Global').tasks = []
	
	for i in range(8):
		$TextureRect/HBoxContainer.get_child(i).updateButton('empty')

func _on_Walk_pressed():
	_addTask('walk')
