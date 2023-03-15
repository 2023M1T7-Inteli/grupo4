extends Control
var resp
func _ready():
	pass # Replace with function body.

func _on_Resposta1_pressed():
	$feedback.text = String("Parabéns!Você acertou")
	resp = 1
	
func _on_Resposta2_pressed():
	$feedback.text = String("Você errou. Tente novamente.")
	resp = 0
