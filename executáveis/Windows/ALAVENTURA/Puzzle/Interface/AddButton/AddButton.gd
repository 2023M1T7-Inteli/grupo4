extends TextureButton

export(int) var index
onready var task = ''

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Update button image
func updateButton(newTask):
	match newTask:
		"walk":
			self.texture_normal = load('res://Puzzle/Interface/Gerenciador/images/arrows/walk/walk.png')
			self.texture_pressed = load('res://Puzzle/Interface/Gerenciador/images/arrows/walk/walk.png')
		"turn":
			self.texture_normal = load('res://Puzzle/Interface/Gerenciador/images/arrows/turn/turn.png')
			self.texture_pressed = load('res://Puzzle/Interface/Gerenciador/images/arrows/turn/turn.png')
		"turn_anti":
			self.texture_normal = load('res://Puzzle/Interface/Gerenciador/images/arrows/turn_anti/turn_anti.png')
			self.texture_pressed = load('res://Puzzle/Interface/Gerenciador/images/arrows/turn_anti/turn_anti.png')
		"empty":
			self.texture_normal = load('res://Puzzle/Interface/Gerenciador/images/add.png')
			self.texture_pressed = load('res://Puzzle/Interface/Gerenciador/images/add.png')

# Called when the node enters the scene tree for the first time.
func _ready():
	task = get_node("/root/Global").tasks
	if (len(task) > index):
		task = task[index]
		print(task)
	updateButton(task)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Add_pressed():
	print('a')
	$AnimationPlayer.current_animation = 'slide'
	$AnimationPlayer.play()
	print('b')

#func addTask(newTask):
#	task = newTask
#	get_node("/root/Global").addTask(newTask)
#	updateButton(newTask)
#	$AnimationPlayer.current_animation = 'slide_down'
#	$AnimationPlayer.play()

#func _on_TurnAnti_pressed():
#	addTask('turn_anti')
#
#func _on_Turn_pressed():
#	addTask('turn')
#
#func _on_Walk_pressed():
#	addTask('walk')
