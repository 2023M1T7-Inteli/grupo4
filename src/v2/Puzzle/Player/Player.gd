extends KinematicBody2D

var playing = false
var tasks = []

var velocity = Vector2()
export (int) var speed = 72
var tilemap = 32

# Saves where player is going to
onready var target = position

# Saves if player is in motion
onready var moving = false

func start():
	playing = true
	tasks = get_node("/root/Global").tasks
	print('AAAAAAAAAAAAA')

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Global").connect("playing", self, "start")
	
			
func run(currentTask):
	var x = tasks[currentTask]
	
	match(x):
		"up":
			target.y -= tilemap
			$Sprite.play("up")
		"down":
			target.y += tilemap
			$Sprite.play("down")
		"left":
			target.x -= tilemap
			$Sprite.play("left")
		"right":
			target.x += tilemap
			$Sprite.play("right")
			
	# Set player velocity according to target and speed
	velocity = position.direction_to(target) * speed
		
	print(tasks[currentTask])
	if (currentTask + 1 < len(tasks)):
		yield(get_tree().create_timer(1.5), "timeout")
		run(currentTask + 1)

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
		$Sprite.play("idle")
		moving = false
