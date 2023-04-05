extends Node

# Variables for continues, scene, game status, tasks, and points.
var continues = 1
var current_amount_of_continues = continues
var current_scene = null
var status = 'none'
var tasks = []
var pontos = 0
# Signals to notify other nodes about game events.
signal playing
signal lost

func loadPhase():
	# Function to load the current phase/scene.
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func _ready():
	# Function that runs when the node is added to the scene tree.
	loadPhase()

func addTask(task):
	# Function to add a task to the task list.
	print(task)
	if (len(tasks) < 8):
		tasks.append(task)
		
func setContinues(number):
	# Function to set the number of continues.
	continues = number
	current_amount_of_continues = number
	
func start():
	# Function to start the game.
	print(tasks)
	emit_signal('playing')
	
func resetList():
	# Function to reset the task list.
	tasks = []
