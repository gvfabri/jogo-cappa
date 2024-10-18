extends CharacterBody2D
class_name PlayerClass

@onready var sprite = $AnimatedSprite2D
@export var health_component : HealthComponent
@export var jump_height: float
@export var item: ItemClass

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

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
	get_parent().free_selected()

func _on_hitbox_component_area_entered(attack):
	if attack.is_in_group("attack") && attack.attack_owner != self:
		health_component.damage(attack)
