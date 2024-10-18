extends CharacterBody2D
class_name PlayerClass

@onready var sprite = $AnimatedSprite2D
@export var health_component : HealthComponent
@export var jump_height: float
@export var item: ItemClass
@export var char_num: int

var ghost = preload("res://characters/CharacterGhost.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_sprite():
	return sprite

func use_item():
	if item == null:
		return
	item.useItem(self)

func jump():
	# Handle jump.
	if Input.is_action_just_pressed("Move_Up") and is_on_floor():
		velocity.y = jump_height

func die():
	if (dead):
		return
	dead = true
	var inst = ghost.instantiate()
	await get_parent().free_char(char_num)
	inst.ghost = char_num
	inst.global_position = global_position
	get_tree().get_root().get_node("Main").add_child(inst)
	queue_free()

func _on_hitbox_component_area_entered(attack):
	if attack.is_in_group("attack") && attack.attack_owner != "Player":
		health_component.damage(attack)
