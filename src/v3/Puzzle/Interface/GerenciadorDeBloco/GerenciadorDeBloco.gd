extends VBoxContainer

var tasks = []

# Função que deleta todos os nodes filhos do node passado
static func delete_children(node):
	# Loopa pelos filhos do node passado
	for n in node.get_children():
		# Remove o filho da vez
		node.remove_child(n)
		
		# Limpa ele da queue do loop para que não loope por onde não existe filho
		n.queue_free()

# Atualiza a lista de tarefas
func update_list():
	# Chama a função que deleta os nodes filhos do Container Vertical
	delete_children($TaskList)
	print(tasks)
	# Loopa pela lista de tasks
	for x in tasks:
		# Cria uma nova task
		var task_scene = load("res://Puzzle/Interface/GerenciadorDeBloco/BlocoDeComando/BlocoDeComando.tscn").instance()
		
		# Atualiza propriedades do novo node
		task_scene.title = x
		
		# Adiciona ele como filho do Container Vertical
		$TaskList.add_child(task_scene)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _addTask(task):
	# Adiciona task no global
	get_node("/root/Global").addTask(task)
	
	tasks = get_node("/root/Global").tasks
	
	# Chama a função que atualiza a lista
	update_list()

func _on_AddTask_pressed():
	var moves = load("res://Puzzle/Interface/AdicionarBloco/AdicionarBloco.tscn")
	var moves_instance = moves.instance()
	moves_instance.set_name('moves')
	get_tree().get_root().add_child(moves_instance)
