extends CanvasLayer

var tasks = []
export(int) var continues

# Function that deletes all child nodes of the given node
static func delete_children(node):
	# Loops through the child nodes of the given node
	for n in node.get_children():
		# Removes the current child node
		node.remove_child(n)
		
		# Frees the current child node from the loop queue to prevent looping through non-existent child nodes
		n.queue_free()
		
# Function called when the node is ready to be used
func _ready():
	get_node("/root/Global").loadPhase()
	get_node("/root/Global").tasks = []
	get_node("/root/Global").setContinues(continues)
	$PlaysLeft.text = String(continues)

# Function called when the player presses the play button
func _on_Play_pressed():
	# Calls the function that starts the game in Global
	get_node('/root/Global').start()
	
# Subtracts 1 from the number of times the player can play in the same playthrough
func subtractContinues():
	# Updates the number of continues (subtracts 1)
	Global.setContinues(Global.current_amount_of_continues - 1)
	
	# Updates the text that displays the number of times
	$PlaysLeft.text = String(Global.current_amount_of_continues)

# Resets all tasks
func resetList():
	get_node("/root/Global").resetList()

# Function called when the player clicks the return-to-map button
func _on_returnMap_pressed():
	# Changes the scene to the map
	get_tree().change_scene("res://HUB.tscn")

# Adds tasks
func _addTask(task):
	# If the player has already started the run, they cannot start it again
	if get_parent().get_node('Player').started:
		return
		
	# Checks if the global is already full
	var g = get_node('/root/Global')
	
	# If the task list inside the global is not full (less than 8)
	if len(g.tasks) < 8:
		# Adds the task to the global
		get_node('/root/Global').addTask(task)
		
		tasks = get_node('/root/Global').tasks
		
		$TextureRect/HBoxContainer.get_child(len(tasks) - 1).updateButton(task)
	
# Functions called when the player presses the corresponding buttons
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
