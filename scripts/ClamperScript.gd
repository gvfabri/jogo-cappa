extends Node

@onready var detector_area = $DetectorArea
@onready var health_component = $Hurtbox

var aware = false
var attacking = false
var detected = 0
var attack_detect = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	aware = false
	attacking = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_detector_area_area_entered(area):
	if area.is_in_group("player"):
		detected += 1
	if (detected > 0):
		aware = true

func _on_detector_area_area_exited(area):
	if area.is_in_group("player"):
		detected -= 1
	if (detected <= 0):
		aware = false

func _on_attack_area_area_entered(area):
	if area.is_in_group("player"):
		attack_detect += 1
	if (attack_detect > 0):
		attacking = true

func _on_attack_area_area_exited(area):
	if area.is_in_group("player"):
		attack_detect -= 1
	if (attack_detect <= 0):
		attacking = false

func die():
	queue_free()


func _on_hurtbox_area_entered(attack):
	if attack.is_in_group("attack") && attack.attack_owner != self:
		die()
