extends ItemClass

@onready var main = get_tree().get_root().get_node("Main")
@onready var explosion = load("res://scenes/explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func useItem(player: PlayerClass):
	var inst = explosion.instantiate()
	inst.spawn_pos = self.global_position
	main.add_child(inst)
