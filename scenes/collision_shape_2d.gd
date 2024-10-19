extends Area2D

# Defina a nova posição para a qual o player deve ser movido
var new_position = Vector2(1250, 800)  # Substitua por sua posição desejada

func _ready():
	# Conecta o sinal `body_entered` ao método `_on_TeleportArea_body_entered`
	self.connect("body_entered", Callable(self, "_on_TeleportArea_body_entered"))
	
func _on_TeleportArea_body_entered(body):
	if body.name == "PlayerHandler":
		body.position = new_position
