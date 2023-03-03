extends Control

export(String) var title
export(String) var id

func _ready():
	$task/title.text = title


func _on_delete_pressed():
	pass # Replace with function body.
