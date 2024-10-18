extends Node2D

@onready var anim_player = $AnimationPlayer
var ghost := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if(ghost == 0):
		anim_player.play("Character")
	elif(ghost == 1):
		anim_player.play("Spear")
	elif (ghost == 2):
		anim_player.play("Torch")
	elif (ghost == 3):
		anim_player.play("Bomb")


