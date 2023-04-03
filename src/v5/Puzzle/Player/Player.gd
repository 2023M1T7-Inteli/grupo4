extends KinematicBody2D

var playing = false
var started = false
var tasks = []

signal finishedRun

var velocity = Vector2()
export (int) var speed = 72
var tilemap = 70

# Saves where player is going to
onready var target = position

# Saves if player is in motion
onready var moving = false

# Defines possible directions
var directions = ['right', 'up', 'left', 'down']
var currentDirection = 0

func start():
	if (!started):
		started = true
		playing = true
		print('TASKS')
		print(Global.tasks)
		tasks = Global.tasks

func updateSpriteDirection():
	match(directions[currentDirection]):
		'up':
			$Sprite.play('idle_up')
		'down':
			$Sprite.play('idle')
		'right':
			$Sprite.play('idle_right')
		'left':
			$Sprite.play('idle_left')
	
func rotate(command):
	if (command == 'turn'):
		if (currentDirection == 0):
			currentDirection = 3
		else:
			currentDirection -= 1
	elif (command == 'turn_anti'):
		if (currentDirection == 3):
			currentDirection = 0
		else:
			currentDirection += 1
			
	updateSpriteDirection()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("INICIOU AQUI")
	print(get_node("/root/Global"))
	print(get_node("/root/Global").tasks)
	get_node("/root/Global").connect("playing", self, "start")
	
func run(currentTask):
	if (!!get_parent() && get_parent().status != 'none'): 
		return
		
	if (!!get_tree()):
		yield(get_tree().create_timer(1.5), "timeout")
		
#	if (get_node("/root/Global").current_amount_of_continues == 0):
#		playing = false
#		return
		
	var x = tasks[currentTask]
	if (x == 'turn' || x == 'turn_anti'):
		rotate(x)
	else:
		match(directions[currentDirection]):
			'up':
				target.y -= tilemap
				$Sprite.play("up")
			"down":
				target.y += tilemap
				$Sprite.play("down")
			"right":	
				target.x += tilemap
				$Sprite.play("right")
			"left":
				target.x -= tilemap
				$Sprite.play("left")
			
	# Set player velocity according to target and speed
	velocity = position.direction_to(target) * speed
		
	if (currentTask < len(tasks) - 1):
		print(currentTask - len(tasks) - 1)
		run(currentTask + 1)
	else:
		started = false
		if (!!get_parent()):
			get_parent().get_node("HUD").subtractContinues()
		emit_signal("finishedRun")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (playing == true && len(tasks) >= 1):
		print("running")
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
		updateSpriteDirection()
		moving = false
