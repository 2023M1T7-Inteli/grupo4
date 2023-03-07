extends Control

export(String) var title
export(int) var id

func _ready():
	$title.text = title

func _on_delete_pressed():
	# Vai pegar nodes acima e acionar a função para remover a task presente no 2 acima
	get_parent().get_parent()._removeTask(id)
