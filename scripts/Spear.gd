extends ItemClass

var spear_interactable

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func useItem(player: PlayerClass):
	spear_interactable.interact()

func _on_area_2d_area_entered(area):
	if area.is_in_group("spear interactable"):
		spear_interactable = area


func _on_area_2d_area_exited(area):
	if area.is_in_group("spear interactable"):
		spear_interactable = null
