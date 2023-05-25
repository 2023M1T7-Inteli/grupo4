extends CanvasLayer

func _ready():
	pass 

#stop instantiating the scene
func _on_TextureButton_pressed():
	self.queue_free()
	
