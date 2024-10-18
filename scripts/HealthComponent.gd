extends Node
class_name HealthComponent

@export var MAX_HEALTH := 2
var health : float

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH


func damage(attack: Attack):
	print(attack)
	health -= attack.attack_damage
	
	if health <= 0 && get_parent().has_method("die"):
		get_parent().die()
