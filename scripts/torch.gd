extends ItemClass

@onready var main = get_tree().get_root().get_node("Main")
@onready var attack = load("res://scenes/torch_attack.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func useItem(player: PlayerClass):
	var inst = attack.instantiate()
	inst.spawn_pos = self.global_position
	main.add_child(inst)
