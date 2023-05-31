extends Node2D


func _ready():
	pass

func _on_returnF1_pressed():
	get_tree().change_scene("res://Puzzle/Fase1/Mapa.tscn")
