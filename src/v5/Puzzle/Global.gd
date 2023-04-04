extends Node

var continues = 1
var current_amount_of_continues = continues
var current_scene = null
var tasks = []
var pontos = 0

signal playing
signal lost

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
	
	if (number == 0):
		var winnerScene = load("res://Puzzle/Interface/Scenes/LoserScene/loserScene.tscn").instance()
		get_tree().current_scene.add_child(winnerScene)

	
func start():
	print(tasks)
	emit_signal('playing')
	
func resetList():
	tasks = []
