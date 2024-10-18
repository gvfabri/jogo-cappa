extends Node

@onready var detector_area = $DetectorArea

var aware = false
var attacking = false

# Called when the node enters the scene tree for the first time.
func _ready():
	aware = false
	attacking = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_detector_area_area_entered(area):
	if area.is_in_group("player"):
		aware = true


func _on_detector_area_area_exited(area):
	if area.is_in_group("player"):
		aware = false

func _on_attack_area_area_entered(area):
	if area.is_in_group("player"):
		attacking = true

func _on_attack_area_area_exited(area):
	if area.is_in_group("player"):
		attacking = false
