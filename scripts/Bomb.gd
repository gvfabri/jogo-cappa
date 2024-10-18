extends ItemClass

@onready var col_shape_2D = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func useItem(player: PlayerClass):
	player.die()
	col_shape_2D.set_deferred("disabled", false)
