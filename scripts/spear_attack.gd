extends Node2D

@onready var anim = $AnimatedSprite2D
var spawn_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	global_position = spawn_pos

func _on_timer_timeout():
	queue_free()
