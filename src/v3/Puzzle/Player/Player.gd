extends KinematicBody2D

var playing = false
var tasks = []

var velocity = Vector2()
export (int) var speed = 72

# Saves where player is going to
onready var target = position

# Saves if player is in motion
onready var moving = false

# Defines possible directions
var directions = ['right', 'up', 'left', 'down']
var currentDirection = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func rotate(command):
	if (command == 'rotate_counter'):
		if (currentDirection == 0):
			currentDirection = 3
		else:
			currentDirection -= 1
	elif (command == 'rotate'):
		if (currentDirection == 3):
			currentDirection == 0
		else:
			currentDirection += 1
			
func run(currentTask):
	var x = tasks[currentTask]
	if (x == 'rotate' || x == 'rotate_counter'):
		rotate(x)
	if (x == 'walk'):
		if (directions[currentDirection] == 'up'):
			target.y -= 36
		elif (directions[currentDirection] == 'down'):
			target.y += 36
		elif (directions[currentDirection] == 'right'):
			target.x += 36
		elif (directions[currentDirection] == 'left'):
			target.x -= 36
			
		# Set player velocity according to target and speed
		velocity = position.direction_to(target) * speed
		
	print(tasks[currentTask])
	if (currentTask + 1 < len(tasks)):
		yield(get_tree().create_timer(1), "timeout")
		run(currentTask + 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (playing == true):
		run(0)
		playing = false
		# If the distance between the player and where it is going is more than 5
	if (position.distance_to(target) > 5):
		# Slide player to target
		velocity = move_and_slide(velocity)
		
		moving = true
		# If the distance is less than 5
	else:
		# Save that player is NOT moving
		moving = false

func _on_Play_pressed():
	tasks = get_node("/root/Global").tasks
	playing = true
