extends Node2D
class_name PlayerHandler

const SPEED = 300.0
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var camera = $Camera2D
@onready var players = [$PlayerCharacter, $PlayerSpear, $PlayerTorch, $PlayerBomb]
var selected_player

func _ready():
	selected_player = 0

func _process(delta):
	camera.transform = players[selected_player].transform
	if Input.is_action_just_pressed("Restart"):
		reset_stage()
	if Input.is_action_just_pressed("Action"):
		players[selected_player].use_item()
	if Input.is_action_just_pressed("Select_First"):
		change_player(0)
	if Input.is_action_just_pressed("Select_Second"):
		change_player(1)
	if Input.is_action_just_pressed("Select_Third"):
		change_player(2)
	if Input.is_action_just_pressed("Select_Fourth"):
		change_player(3)

func _physics_process(delta):
	var player = players[selected_player]
	var sprite = player.get_sprite()

	# Add the gravity.
	if not player.is_on_floor():
		player.velocity.y += gravity * delta

	player.jump()

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

func find_non_null_player():
	for i in 4:
		selected_player = (selected_player + 1) % 4
		if players[selected_player] != null:
			break

func change_player(num):
	selected_player = num
	if (players[selected_player] == null):
		find_non_null_player()

func free_selected():
	players[selected_player].queue_free()
	players[selected_player] = null
	await find_non_null_player()
	if players[selected_player] == null:
		reset_stage()
	change_player(selected_player)
