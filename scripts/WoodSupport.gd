extends Node2D

@onready var main = get_tree().get_root().get_node("Main")
@onready var rochas = preload("res://scenes/rock_ramp.tscn")
@onready var explosion = preload("res://scenes/explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func die():
	var inst = await rochas.instantiate()
	main.add_child(inst)
	var explosion = await explosion.instantiate()
	explosion.spawn_pos = self.global_position + Vector2(0, 20)
	main.add_child(explosion)
	queue_free()

func _on_detect_attack_area_entered(attack):
	if (attack.is_in_group("attack") || attack.is_in_group("spear attack") || attack.is_in_group("torch attack")):
		die()
