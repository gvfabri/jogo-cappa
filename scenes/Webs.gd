extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func die():
	queue_free()

func _on_hurtbox_area_entered(attack):
	if (attack.is_in_group("attack") || attack.is_in_group("spear attack") || attack.is_in_group("torch attack")) && attack.attack_owner != "Web":
		die()
