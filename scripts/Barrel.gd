extends Sprite2D

@onready var main = get_tree().get_root().get_node("Main")
@onready var explosion = load("res://scenes/explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func die():
	queue_free()

func explode():
	var inst = explosion.instantiate()
	inst.spawn_pos = self.global_position
	main.add_child(inst)

func _on_hurtbox_area_entered(attack):
	if (attack.is_in_group("torch attack")) && attack.attack_owner != self:
		await explode()
		die()
