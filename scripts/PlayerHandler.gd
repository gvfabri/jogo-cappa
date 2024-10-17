extends Node2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var players = [$PlayerCharacter]
var selected_player

func _ready():
	selected_player = 0

func _process(delta):
	if Input.is_action_just_pressed("Restart"):
		reset_stage()

func _physics_process(delta):
	var player = players[selected_player]
	var sprite = player.get_sprite()
	
	# Add the gravity.
	if not player.is_on_floor():
		player.velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Move_Up") and player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("Move_Left", "Move_Right")
	sprite.flip_h = (direction == -1)
	if direction:
		player.velocity.x = direction * SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, SPEED)

	player.move_and_slide()

func reset_stage():
	get_tree().reload_current_scene()

func change_player(num):
	selected_player = players[num]
