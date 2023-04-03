extends Control
var resp
var resposta1 = load("res://winner & loser bgd/winnerScene_bau.tscn").instance()
var resultado = 0
func _ready():
	pass # Replace with function body.

func _on_Resposta1_pressed():
	$feedback.text = String("Parabéns!Você acertou")
	resp = 1
	get_tree().current_scene.add_child(resposta1)

	
func _on_Resposta2_pressed():
	$feedback.text = String("Você errou. Tente novamente.")
	resp = 0


func _on_TextureButton_pressed():
	self.visible = false
	
func contaMat(x,s,y,a):
	$Label2.text = "Quanto é " + str(x) + s + str(y)
	$controls/Resposta1.text = str(x)
	$controls2/Resposta2.text = str(a)
	if s == "+":
		resultado = x + y
	elif s == "-":
		resultado = x - y
	elif s == "x":
		resultado = x*y
	elif s == "/":
		resultado = x/y
	else:
		resultado = "Inválido"
	$controls/Resposta1.text = str(resultado)
	
