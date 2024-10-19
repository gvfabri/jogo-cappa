extends Node2D

@onready var audio_stream_player = $AudioStreamPlayer
@onready var anim = $AnimatedSprite2D
var spawn_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	audio_stream_player.play()
	global_position = spawn_pos

func _on_timer_timeout():
	queue_free()
