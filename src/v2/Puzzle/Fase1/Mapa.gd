extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://world.tscn")
	



func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")


func _on_vitoria_body_entered(body):
	get_tree().change_scene("res://tela inicial completa/starSreen.tscn")
