extends Control
func _ready():
	pass # Replace with function body.

func _on_Resposta1_pressed():
	$feedback.text = String("Parabéns!Você acertou")
	
func _on_Resposta2_pressed():
	$feedback.text = String("Você errou. Tente novamente.")
