extends Node

var continues = 1
var current_amount_of_continues = continues
var current_scene = null
var tasks = []

signal playing

func loadPhase():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func _ready():
	loadPhase()
	
func addTask(task):
	print(task)
	if (len(tasks) < 8):
		tasks.append(task)
		
func setContinues(number):
	continues = number
	current_amount_of_continues = number
	
func start():
	print(tasks)
	emit_signal('playing')
	
func resetList():
	tasks = []
