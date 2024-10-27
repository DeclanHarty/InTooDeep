class_name Glowstick
extends CharacterBody2D


const SINKING_ACCELERATION = 25;
const MAX_SINK_SPEED = 25;
const TIME_UNTIL_PICKUP_SEC = 1;
var can_pickup : bool = false
var rot_v

signal pickup_glowstick;

func _ready():
	var turn_direction = randf_range(-1, 1)
	rot_v = randf_range(.1, 1) * (sign(turn_direction))
	await get_tree().create_timer(TIME_UNTIL_PICKUP_SEC).timeout
	can_pickup = true

func _physics_process(delta: float) -> void:
	if(!is_on_floor()):
		velocity.y = move_toward(velocity.y, MAX_SINK_SPEED, SINKING_ACCELERATION * delta)
		rotation += rot_v * delta
	else:
		rot_v = 0;
		velocity = Vector2(0,0)

	move_and_slide()


func _on_area_2d_area_entered(area: Area2D):
	if can_pickup and area.name == "PlayerArea2D":
		queue_free()
		pickup_glowstick.emit()
