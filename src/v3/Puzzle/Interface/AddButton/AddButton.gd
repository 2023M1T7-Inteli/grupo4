extends TextureButton

export(int) var index
onready var task = ''

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Update button image
func updateButton():
	match task:
		"left":
			self.texture_normal = load('res://Puzzle/Interface/Gerenciador/images/arrows/left/left_arrow.png')
			self.texture_pressed = load('res://Puzzle/Interface/Gerenciador/images/arrows/left/left_arrow_pressed.png')
		"right":
			self.texture_normal = load('res://Puzzle/Interface/Gerenciador/images/arrows/right/right_arrow.png')
			self.texture_pressed = load('res://Puzzle/Interface/Gerenciador/images/arrows/right/right_arrow_pressed.png')
		"up":
			self.texture_normal = load('res://Puzzle/Interface/Gerenciador/images/arrows/up/up_arrow.png')
			self.texture_pressed = load('res://Puzzle/Interface/Gerenciador/images/arrows/up/up_arrow_pressed.png')
		"down":
			self.texture_normal = load('res://Puzzle/Interface/Gerenciador/images/arrows/down/down_arrow.png')
			self.texture_pressed = load('res://Puzzle/Interface/Gerenciador/images/arrows/down/down_arrow_pressed.png')

# Called when the node enters the scene tree for the first time.
func _ready():
	task = get_node("/root/Global").tasks[index]
	updateButton()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Add_pressed():
	print('a')
	$AnimationPlayer.current_animation = 'slide'
	$AnimationPlayer.play()
	print('b')

func addTask(newTask):
	task = newTask
	get_node("/root/Global").addTask(index, newTask)
	updateButton()
	$AnimationPlayer.current_animation = 'slide_down'
	$AnimationPlayer.play()

func _on_ArrowLeft_pressed():
	addTask('left')

func _on_ArrowRight_pressed():
	addTask('right')

func _on_ArrowUp_pressed():
	addTask('up')

func _on_ArrowDown_pressed():
	addTask('down')
