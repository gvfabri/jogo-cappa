extends Area2D

func _ready():
	# Conecta o sinal "body_entered" ao método "_on_Area2D_body_entered"
	self.connect("body_entered", Callable(self, "_on_Area2D_body_entered"))

# Função chamada quando um corpo entra na área
func _on_Area2D_body_entered(body):
	if body.name == "PlayerHandler":
		change_level()

# Função para mudar de nível
func change_level():
	# Carrega a nova cena do próximo nível
	get_tree().change_scene("res://phase_2.tscn")
