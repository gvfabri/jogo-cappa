extends Node

@onready var sprite = $AnimatedSprite2D
@export var health_component : HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_sprite():
	return sprite

func die():
	get_parent().free_selected()

func _on_hitbox_component_area_entered(attack):
	print(attack)
	if attack.is_in_group("attack"):
		print("Ataque!")
		health_component.damage(attack)
