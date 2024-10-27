extends PointLight2D

@onready var anchor : Node2D = $".."
var current_direction : int = 1
const LIGHT_DISTANCE_FROM_PLAYER : float = 244.0
const LIGHT_ROTATION_SPEED : float = 5
var target_light_position : Vector2 = Vector2(0,0)
var rotation_target : float

func _process(delta: float) -> void:
	var added_rads = (PI if position.x < 0 else 0.0)
	var mouse_pos = get_global_mouse_position().normalized()
	#anchor.rotation = rotate_toward(anchor.rotation, atan(input.y/input.x) + added_rads, LIGHT_ROTATION_SPEED * delta)
	anchor.rotation = rotate_toward(anchor.rotation, atan(mouse_pos.y/mouse_pos.x) + added_rads, LIGHT_ROTATION_SPEED * delta)
