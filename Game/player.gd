extends KinematicBody2D
# Saves player velocity
export (int) var speed = 36
# Saves player velocity
var velocity = Vector2()

# Saves where player is going to
onready var target = position

# Saves if player is in motion
onready var moving = false


func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# If player is not moving
	# This verification is used to prevent player from moving diagonally
	# And to make the user wait for the player movement to finish before making another move
	if !moving:
		# If "A" is pressed
		if Input.is_action_just_pressed("ui_right"):
			# Unflip sprite to make it look to the right
			get_node("AnimatedSprite").set_flip_h(false)
			# Set the target to 18 to the right
			target.x += 18
		# If "D" is pressed
		if Input.is_action_just_pressed("ui_left"):
			# Flip sprite to make it look to the left
			get_node("AnimatedSprite").set_flip_h(true)
			# Set the target to 18 to the left
			target.x -= 18
		# If "S" is pressed
		if Input.is_action_just_pressed("ui_down"):
			# Set the target to 18 down
			target.y += 18
		# If "W" is pressed
		if Input.is_action_just_pressed("ui_up"):
			# Set the target to 18 up
			target.y -= 18
	
	# Set player velocity according to target and speed
	velocity = position.direction_to(target) * speed
	
	# If the distance between the player and where it is going is more than 5
	if position.distance_to(target) > 5:
		# Save that player is moving
		moving = true
		# Slide player to target
		velocity = move_and_slide(velocity)
		# Change player sprite animation to run
		$AnimatedSprite.animation = "run"
		
		# If the distance is less than 5
	else:
		# Save that player is NOT moving
		moving = false
		# Change player sprite animation to idle
		$AnimatedSprite.animation = "idle"
