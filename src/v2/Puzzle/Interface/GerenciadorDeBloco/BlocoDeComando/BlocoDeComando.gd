extends Control

export(String) var title
export(int) var id

func _ready():
	$title.text = title


func _on_delete_pressed():
	get_tree().get_root().get_child(1).get_child(1)._removeTask(id)
