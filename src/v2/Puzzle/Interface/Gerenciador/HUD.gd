extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Add_pressed():
	print('a')
	get_node("TextureRect/AnimationPlayer").add_animation("slide", 'slide up add command')
	get_node("TextureRect/AnimationPlayer").play("slide")


func _on_Arrow_pressed():
	print('a')
	get_node("TextureRect/AnimationPlayer").play("slide")
