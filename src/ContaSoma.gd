extends Control
var resp
var resposta1 = load("res://winner & loser bgd/winnerScene_bau.tscn").instance()
var resposta2 = load("res://winner & loser bgd/loserScene_bau.tscn").instance()
var resultado = 0
func _ready():
	pass # Replace with function body.

func _on_Resposta1_pressed():
	resp = 1
	get_tree().current_scene.add_child(resposta1)
	if resp == 1:
		Global.pontos += 5
		
func _on_Resposta2_pressed():
	resp = 0
	get_tree().current_scene.add_child(resposta2)

func _on_TextureButton_pressed():
	self.visible = false
	
func contaMat(x,s,y,a):
	$Label2.text = "Quanto é " + str(x) + s + str(y)
	$controls2/Resposta2.text = str(resultado + 9)
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
	